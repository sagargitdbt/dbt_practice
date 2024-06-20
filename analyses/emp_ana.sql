-- analyses/employee_analysis.sql

WITH employee_summary AS (
    SELECT
        deptno as department,
        COUNT(empno) AS num_employees,
        AVG(sal) AS avg_salary,
        MAX(hiredate) AS most_recent_hire
    FROM {{ ref('employee') }}
    GROUP BY deptno
)

SELECT
    department,
    num_employees,
    avg_salary,
    most_recent_hire
FROM employee_summary
ORDER BY num_employees DESC
