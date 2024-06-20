{{config(materialized='materializedview')}}

with emp as(
select * from {{source('siva','EMP')}}
),
 dept as (
select * from  {{source('siva','DEPT')}}
)

select e.*,d.DNAME,d.LOC from emp e inner join dept d on e.deptno=d.deptno