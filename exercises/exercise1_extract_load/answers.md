
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