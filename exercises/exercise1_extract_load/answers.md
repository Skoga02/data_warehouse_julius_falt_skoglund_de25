# Exercise 1 - Extracting and loading
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
_

**f) Discuss the advantages of performing data transformations after loading the data.**
_

**g) What is the purpose of roles in Snowflake?**
_

**h) Explain the diffrence between USAGE and OWNERSHIP privileges.**
_

**i) What information is required to create a user in Snowflake?**
_

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