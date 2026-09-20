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
* `Sysadmin`: A Snowflake system role used to create, warehouses, objects, databases, schemas, and tables. 
* `Useradmin`: A Snowflake system role used to create and manage other objects.
* `orgadmin`:  A Snowflake system role with organized-level privilages, such as managing accounts within an organization.
* `Securityadmin`: A snowflake system role mainly used to manage security, roles, grants, and access privialges.
* `Accountadmin`: The highest-level snowflake role. It has broad access to the account and should be used carefully.
* `Role inheritance`: In this case is already built by snowflake. Highest role is `Accountadmin`, under that we have `Securityadmin`, and `Sysadmin`, under that we have `Useradmin` and `Custom role`.
* `Public role`: Objects owned by PUBLIC is avalible to everyone. Usually used when testing othervise barely used.
* `Public schema`: A schmea that is commonly available by default in a database. It can contain tables, views, and other database objects.
* `API`: Application Programming Interface. A way for applications to communicate with and request data from another application or service.
* `ETL`: Extract, Transform, Load. Data is extracted from a source, transformed, and then loaded into the destination.  
* `ELT`: Extract, Load, Transform. Data is extracted, loaded into the destination first, and transformed there.
* `Data ingestion`: The process of collecting and bringing data from one or more sources into a data system.
* `Batch ingestion`: Data is collceted and processsed in groups at scheduled or specific intevals rather than continuously.
* `Streaming ingestion`: Data is continuously ingested and proccessed as it produced, often with very low latency.
* `Incremental load`: Loading only new or chenged data instead of laoding the entire dataset agian.
* `dlt connectors`: Pre-built dlt components that help extract data from difffrent sources such as APIs, datasets, or files.
* `snowflake user`: An account identity that can log in to Snowflake and perform actions according to the rules and privileges assigned to them.
* `staging layer`: A temporary or intemediate area where raw or recently extracted data is stored before further transformation or processing.
* `granted to`: Specifies who recives a privilege. Example GRANT USAGE ON DATABASE movie TO ROLE movies_reader; -> movies_reader is the role being granted the privilege.
* `granted on`: SPecifies what object the privilege applies to. Example: GRANT USAGE ON DATABASE movies... -> the privilege is grnated on the movies database.
* `granted by`: Specifies who gave the privilege or which role was responsible for granting it.
* `secrets.toml`: A dlt configuration file used to store sensitive connection infromation and credentials, such as database credentials or API keys.
* `RBAC`: Role-Based Access Control. A security model where permissions are assigned to roles, and useres recive permissions through those roles.
* `CRUD operations`: The four basic database operation: Create, Read, Update, Delete.
* `resource dlt`: A dlt object that represents a specific set of data that should be extracted and loaded. It defines how data is provided to the pipline.
* `source dlt`: A dlt object that gorups related resources from the same data source.
* `yield python`: A python keyword used to produce values one at a time from a function. It turns the function into a generator isnstead of returning all values at once.