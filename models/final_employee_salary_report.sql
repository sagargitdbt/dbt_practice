{{config(materialized='table',alias='emp_salary_report')}}

with high_salary_emps as (
    select *
    from {{ ref('ephemeral_emp_salary') }}
),
joined_data as (
    select
        e.empno,
        e.ename,
        e.sal,
        d.dname
    from
        high_salary_emps e
    join
        {{source('siva','DEPT')}} d
    on
        e.deptno = d.deptno
)
select * from joined_data