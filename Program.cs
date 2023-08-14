using DbUp;
using DbUp.Engine;
using DbUp.Helpers;
using Npgsql;
using System.Reflection;

namespace InfraRegistry.DbUp;

class Program
{
    static int Main(string[] args)
    {
        try
        {
            if (args.Length <= 2)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("");
                Console.WriteLine("Usage: ./InfraRegistry.DbUp.exe [Operation] [ConnectionString] [Srid] [MunicipalityCode]");
                Console.WriteLine("");
                Console.WriteLine("Examples of [ConnectionString]:");
                Console.WriteLine("\"Server=127.0.0.1;Port=5432;Database=myDataBase;Integrated Security=true;\"");
                Console.WriteLine("\"Server=127.0.0.1;Port=5432;Database=myDataBase;User Id=myUsername;Password=myPassword;\"");
                Console.WriteLine("");
                Console.WriteLine("[Operation]         [Description]");
                Console.WriteLine(" update              Updates sql scripts that are not already executed");
                Console.WriteLine(" mark                Mark all scripts as executed");
                Console.WriteLine(" markinitial         Mark initial scripts as executed");
                Console.WriteLine(" info                List all unexecuted scripts");
                Console.WriteLine("");
                Console.ResetColor();
                return -1;
            }

            System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.InvariantCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = System.Globalization.CultureInfo.InvariantCulture;

            var action = args[0];
            var connectionString = args[1];
            int srid = int.Parse(args[2]);
            var municipalityCode = args[3];

            EnsureDatabase.For.PostgresqlDatabase(connectionString);

            DatabaseUpgradeResult result;

            if (args.FirstOrDefault() == "markinitial")
            {
                throw new NotImplementedException();
            }

            var upgrader = CreateUpgradeEngine(connectionString, srid, municipalityCode, s => !s.StartsWith("InfraRegistry.DbUp.Scripts.views"));
            var viewUpgrader = CreateUpgradeEngine(connectionString, srid, municipalityCode, s => s.StartsWith("InfraRegistry.DbUp.Scripts.views"), useNullJournal: true);

            if (args.FirstOrDefault() == "mark")
            {
                result = upgrader.MarkAsExecuted();
            }
            else if (args.FirstOrDefault() == "info")
            {
                var scripts = upgrader.GetScriptsToExecute();

                Console.WriteLine("Scripts that need to be run:");
                foreach (var sc in scripts)
                {
                    Console.WriteLine(sc.Name);
                }

                return 0;
            }
            else
            {
                result = upgrader.PerformUpgrade();
                if (result.Successful)
                {
                  result = viewUpgrader.PerformUpgrade();
                }
            }

            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
#if DEBUG
                Console.ReadLine();
#endif
                return -1;
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();
            return 0;
        }
        catch (Exception e)
        {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine(e.Message);
            Console.ResetColor();
        }

        return -1;
    }

    static UpgradeEngine CreateUpgradeEngine(string connectionString, int srid, string municipalityCode, Func<string, bool> filterScripts, bool useNullJournal = false)
    {
        var connStringBuilder = new NpgsqlConnectionStringBuilder(connectionString);

        var databaseName = connStringBuilder.Database;
        var systemUsername = connStringBuilder.Username;

        var upgraderBuilder = DeployChanges.To
          .PostgresqlDatabase(connectionString)
          .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly(), filterScripts)
          .WithVariablesEnabled()
          .WithVariable("body", "$body$") // This is a bug or at least a misfeature in DbUp
          .WithVariable("function", "$function$") // This is a bug or at least a misfeature in DbUp
          .WithVariable("DatabaseName", databaseName)
          .WithVariable("DatabaseOwner", systemUsername)
          .WithVariable("Srid", srid.ToString())
          .WithVariable("MunicipalityCode", municipalityCode)
          .LogToConsole();

        if (useNullJournal)
        {
            upgraderBuilder = upgraderBuilder.JournalTo(new NullJournal());
        }

        return upgraderBuilder.Build();
    }
}
