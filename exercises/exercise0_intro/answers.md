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

