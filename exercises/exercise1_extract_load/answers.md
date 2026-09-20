# Exercise 1 - Extracting and loading
## Task 1: Wich role to use? 
[user_roles.sql](task_1_and_2/snowflake_worksheets/user_roles.sql),
[warehouse_database.sql](task_1_and_2/snowflake_worksheets/warehouse_database.sql),

## Task 2: Load csv markting data to Snowflake
[load_csv.py](task_1_and_2/load_csv.py)

## Task 3: Load API to Snowflake
[setup_db.sql](task_3/snowflake_worksheets/setup_db.sql),
[setup_user_role.sql](task3/snowflake_worksheets/setup_db.sql),
[load_api.py](task3/load_api.py)
## Theory questions
**a) Why is the principal of least privilege important in a company?**
_It improves security, reduces the risk of accidental changes or delitions, limits the damage if an account is compromised,, and makes it easier to control who can access sensitive data._

**b) Explain the role of dlt in managing data pipelines.**
_Dlt can handle things like: Extracting data from APIs, CSV files, databases, etc. It can also load data into Snowflake, creating tables and schemas, managing data types and nested data, and keeping track of pipelines state and loads._

**c) What is a data connector and why is it important in data integration?**
_A data connector is a component that allows a data pipeline to communicate with a particular data source or destination. FOr example: An API connector -> Connects to PostgreSQL, A PostgreSQL connector -> connects to PostgreSQL, or a Snowflake connector -> loads data into Snowflake._

**d) What are the three diffrent write dispositions in dlt?**
_There are three main write dispositions: 1. `replace` replaces the existing data with the new data. 2. `append` adds the new data to the existing data, and 3. `merge` updates existing records and/or adds new records based on a key._

**e) What is ELT and how does it differ from ETL?**
_`Extract Load Transform`, the data is transformed before it is loaded into the data warehouse_
_`Extract Load Transform, The raw data is first loaded into the data warehouse, and the transformations happen afterwards._
_Modern cloud data warehouse such as snowflake make ELT very practical beacause they provide åowerful computing resources for transforming large amounts of data._

**f) Discuss the advantages of performing data transformations after loading the data.**
_

**g) What is the purpose of roles in Snowflake?**
_Roles are used to manage permissions and access control in Snowflalke. Instead of givin permissins directly to every user, you can give permissions to a role and then assign that role to useres._

For example: 
```
Role -> User
parking_dlt_role -> extract_loader_api
```
_This makes permission managment easier and supports the principle of least privilege._

**h) Explain the diffrence between USAGE and OWNERSHIP privileges.**
_`USAGE` generally means that you are allowed to use or access an object, but you don't own or control it. This allows the role to use the databse, but it dosen't give the role ownership of the databse._

```
USAGE = I can use it.
OWNERSHIP = I control it.
```

**i) What information is required to create a user in Snowflake?**
_At basic level, you need a username and authentication infromation. For example:_
```SQL
Create USER extract_loader_api
    PASSWROD = 'Password'
    COMMENT = 'User for loading parking data.'
```

_THe username identifies the user, while the password can be used for password-based autentication._

_You can also configure other properties depending on how the user should authenticate and operate, such as:_
* Default role
* Default warehouse 
* Default namespace
* Email
* Authentication methods

_After creating the user, you can normally assign a role to the user:_
```SQL
GRANT ROLE parking_dlt_role
    TO USER extract_loader_api;
```
_So basic concept is:_
```
USER -> ROLE -> PRIVILEGES -> DATABASE / SCHEMA / TABLE
```
## **Glossary**
* `Sysadmin`: Can create, warehouses, objects, and databases. 
* `Useradmin`: (Administraitor) for user and role creations.
* `orgadmin`: manages operations on organization level. Usually able to create accounts in organization. 
* `Securityadmin`: Has a special privilage that means that he can grant privilage of DB1 or any other objects. Even do he can not use DB1 or personally cannot own it, sins Role 1 owns it.
* `Accountadmin`: Most powerful role under the account role class. Grant to few users, sins this is all access role. Usually a role for the data engineer manager sins this usually inludes billing and payments.
* `Role inheritance`: In this case is already built by snowflake. Highest role is `Accountadmin`, under that we have `Securityadmin`, and `Sysadmin`, under that we have `Useradmin` and `Custom role`.
* `Public role`: Objects owned by PUBLIC is avalible to everyone. Usually used when testing othervise barely used.
* `Public schema`: 
* `API`:
* `ETL`: Extract Transform Load
* `ELT`: Extract Load Transform
* `Data ingestion`: 
* `Batch ingestion`:
* `Streaming ingestion`: 
* `Incremental load`: