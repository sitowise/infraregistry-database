# INFRAREGISTRY Database
This database is a fork of [Gispo's database](https://github.com/GispoCoding/infraO-open) [V1.0.0__initial.sql](https://github.com/GispoCoding/infraO-open/commit/5c3dd1c3b6da401fe6f91e7cbcf064be7025ae0d)

## Prerequisites
Ensure you have the following installed:
- .NET 6 SDK
- PostgreSQL database + PostGIS extension

## How to use
In root folder run:  
`dotnet run [Operation] [ConnectionString] [Srid] [Municipality]`  
Parameters:  
* **[Operation]**:  
  - 'update' - Execute all SQL scripts that haven't been run yet.
  - 'mark' - Mark all scripts as executed.
  - 'info' - List all scripts that haven't been executed.
* **[ConnectionString]**:  
  * `"Server=127.0.0.1;Port=5432;Database=myDataBase;User Id=myUsername;Password=myPassword;"`  
* **[Srid]**
  * The SRID (Spatial Reference ID) used in the database.
* **[Muncipality]**
  * The municipality code in three digit format with leading zeros
