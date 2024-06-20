-- models/emp_incremental_model.sql
{{
    config(
        materialized='incremental',
        alias='emp_tgt',
        unique_key='id'
    )
}}

{% if is_incremental() %}
  -- Incremental logic: only select rows that have been updated or inserted since the last run
  with new_data as (
      select * from {{ source('siva', 'EMP_STG') }}
      where updated_at > (select max(updated_at) from {{ this }})
  )
  select * from new_data
{% else %}
  -- Full refresh logic: select all rows from the source table
  select * from {{ source('siva', 'EMP_STG') }}
{% endif %}