
{{ config(materialized='ephemeral')}}

select   
 empno,   
 ename,  
 sal,  
 deptno
from {{ ref('emp') }} where  sal > 1000