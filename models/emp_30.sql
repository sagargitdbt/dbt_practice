{{config(materialized='view')}}

with emp_10 as 
(
select * from DBT_DB.RAW_SCHEMA.EMP where DEPTNO=30
)
select * from emp_10