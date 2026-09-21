# 1. How much does it cost 
___ 
**a) You have a simple workload that runs daily in Snowflake. The workload uses 0.5 credits per day. Claculate the total usage and cost for 30-day month.**

_0.5 * 30 = 15_

_2.40 * 15 =36$_ 

**b) Your worklaod varies thoruhout the month. For the first 10 days, you use 2 credits per day. For the next 10 days, you use 1.5 credits. per day, and for the last 10 days, you use 1 credit per day. Calculate the total credit usage and cost for a 30-day month.**

_first-10: 2 credits * 10 = 20 credits_,
_total = 20 * 2,40 = 48$_

_mid-10: 1.5 * 10 = 15 credits_,
_total = 15 * 2,40 = 36$_

_last-10: 1 * 10 = 10 credits_,
_total = 10 * 2,40 = 24$_

_total cost for the 30-day period is:_
_48 + 36 + 24 = 108$_

**c) You have three different warehouses running workloads simultaneously. Warehouse A is of size XS, Warehouse B is of size S, and Warehouse C is of size M. Warehouse A is used for 10h/day, B is used for 2h/day and C is used for 1h/day. Calculate the total monthly cost assuming each warehouse runs for the full 30-day month.**

* Warehouse A is xs, 10h/day; 
    - 1 credit per hour
    - 1c * 10h = 10 
    - 10 * 2,40 = 24$ / day
    - 30 * 24 = 720$ for 30 days
* Warehouse B is S, 2h/day; 
    - 2 credits per hour 
    - 2c * 2h = 4 
    - 4 * 2.40 = 9.60$ / day
    - 9.60 * 30 = 288$ for 30 days
* Warehouse C is M, 1h/day; 
    - 4 credits per hour 
    - 4 * 1 = 4 
    - 4 * 2.40 = 9.60$ / day
    - 9.60 * 30 = 288$ for 30 days

**d) Your Snowflake warehouse uses auto-scaling. For the first 10 days, it operates on 2 clusters for 10 hours per day. For the next 10 days, it scales up to 3 clusters for 10 hours per day. For the last 10 days, it scales up to 4 clusters for 10 hours per day. Calculate the total monthly budget. Assume the warehouse consumes 1 credit per hour per cluster.**

___
# 2. Theory questions
These study questions are good to get an overview pf how snowflake works
___

**a)What are the main components of snowflake's architecture?**
_There are three diffrent main components in snowflakes architecture._
* _Cloud services_
    * Security
    * Managment 
    * Metadata
    * Optimazation

* _Compute_
    * Virtual warehouses

* _Database storage_
    * Structured
    * Semi-structured
    * Unstructured

**b) Explain the role of the storage layer in snowflake?**
_The storage in snowflake is responsible for storing the data. It is stored separetly from the compute wich means it can be used by multiple warehouses whitout needing to copy the data._

**c) What is the purpose of the compute layer in snowflake?**
_Inside the compute layer we find virtual warehouses. Which is a cluster of compute resources in snowflake. Virtual warehouses process SQL statements and, using snowspark, run code in languages, such as Java, Python and Scala. Each virtual warehouse is an independent compute cluster that dosen't share compute with other cirtual warehouses. As a result, each virtual warehouse has no effect on the performance of others._

**d) How does the cloud services layer enhance the functionality of snowflake?**
_THe cloud services layer contains a collection of services that tie together all of the diffrent components of snowflake in order to process user requests, from sig-in to query dispatch._

**e) What is a virtual warehouse in Snowflake, and how does it differ from a traditional warehouse?**
_In snowflake, a virtual warehouse us a cluster of computing resources used to execute SQL queries and process data. It provides the computing power, while Snowflake's storage layer stores the actual data._ 
_One big diffrence is the fact that Snowflakes compute and storage are separated which means it can be started, stopped, resized, or suspended while you usually require dedictaed hardware/resources. Sins they are separated workloads won't compete for the compute and scaling can be done automatically for the workloads._

**f) When are the cases you would want to scale up versus scaling out in terms of virtual warehouses and compute resources?**
_Scale up = make one warehouse bigger, and is used when a workload is too slow because it needs more compute power. For example: You have a warehouse running an expensive query. It takes 20 minutes on an XS warehouse. You could increase from XS -> S -> M -> L. This is good for large/complex queries, Big joins and aggregations, Data transformations, ETL/ELT jobs._
_Sclae out = add more warehouses / clusters, and is used when you have many workloads/users running at the same time and they are competing for resources. Snowflake can use multiple clusters in a multi-cluster warehouse. For example: instead of having one enormusly powerful cluster, you can add multiple clusters so multiple queries cab run concurrently. This is good for, bi dashboards, lots of concurrent queries, unpredicted workloads, avoiding queries waiting in que.

**g) How does snoflake's pricing model differ from traditional on-premise data warehousing solutions?**
_Snoeflake uses a consuumption based pricing model. YOu mainly pay for the compute you use and the amount of data you store. COmpute is measured using Snowflake Credits._

**h) What is the difference pay-as-you-go and upfront storaged, and when should you choose one over the other?**
_Pay-as-you-go storage means you pay based on the amount of storage you actually use over time. It is flexible and works well when your storage need can change. While upfront storage means paying for a predetemined amount of storage in advance. It can be useful when you know you storage requirements are stable and predictable.

**i) Explain the conceot of TIme Travel and Fail-safe in Snowflake and it's use cases.**
_Time Travel allows to access or restore historical data that has been changed or delted within Snowflake's retention period._
_For example if wou accidentlly delete rows from a table, Time Travel can be used to look at the table as it existed before the deletion and restore the data._
Common use case:
* Recovering accidentally deleted or changed data
* Looking at historical versions of a table
* Invetsigating data chenages

_Fail-safe is a separeate recovery mechanism that provides an additional period of data protection after the TIme Travel retention period has ended. It is primarily intended for disaster recovery, not for normal user access or everyday data recovery._

A simple way to remember it:
```
Time Travel -> user-accessible historical recovery
Fail-safe -> emergency/disaster recovery
```

# Theory 
`Downstream`: A system, process or user that recives or ueses data from another system.
`Upstream`: A system or process that provides data to another system.
`data warehouse`: A system designed to store and analyze large amounts of structured data, often used for reporting and analytics.
`cloud computing`: USing computing resources such as storage, sservers and databases over the internet instead of managing the physical hardware yourself.
`OLAP`: Online Analytics Processing. Used for analyzing large amounts of data, reporting and business intelegence.
`OLTP`: Online Transaction Processing. Used for handling many small, frequent transactions, such as interesting or updating customer orders.
`virtual warehouse`: Snowflake's compute resource used to execute SQL queries and perform data loading and other operations.
`extrenal stage`: A Snowflake object that points to data stored outside Snowflake, such as files in Amazon S3, Azure Blob Storage or Google Cloud Storage.
`data consumer`: A person, application or system that uses data produced by another system. 
`Scaling. out`: Increasing capacity by adding mote compute resources or machines.
`scaling up`: Increasing the power of an existing compute resources, such as changing a virtual warehouse from x-small to large.
`Snowflake credit`: A unit used by Snowflake to measure compute consumption. The number of credits used depends on the compute resources and how long they run.
`securable object`: A Snowflake object that can have access privileges assigned to it, such as database, schema, table or view.
`schema`: A logical container inside a database that contains objects such as tables, views and stages.
`permanent table`: A normal Snowflake table whose data is retained according to normal Snowflake storage and Time Travel rules.
`transient table`: A table. intended for temporary or intermediate data that does not require Fail-safe protection.
`temporary table`: A table that exist only for the duration of the current user session and is automatically removed when the session ends.
`time travel`: Snowflake functionality that allows you to access historical versions of data that was accidentaly changed or deleted within the retention period.
`fail-safe`: An additional recovery period after Time Travel during which Snoflake can recover data in certain disaster-recovery situations. It is not intended for normal user access.
`view`: A virtual table based on the reuslt of a SQL query. It normally does not store a separate copy of the underlying data.
`table`A databse objct that stores data in rows and columns.
`DML`: Data Manipulation Language. SQL commands used to modify data, such as INSERT, UPDATE, DELETE, and MERGE.
`DDL`: Data Definition Language. SQL commands used to create or modify database objects, such as CREATE, ALTER and DROP.
`DQL`: Data Query Language. SQL used to retrieve data, primarily through SELECT statements.
`DCL`: Data Control Language. SQL commands used to control access and permissons, such as GRANT and REVOKE.