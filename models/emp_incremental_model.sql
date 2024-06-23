-- models/emp_incremental_model.sql
{{
    config(
        materialized='incremental',
        unique_key='id',
        alias='emp_tgt',
        on_schema_change='sync_all_columns'
    )
}}

{% if is_incremental() %}
  -- Incremental logic: only select rows that have been updated or inserted since the last run
      select * from {{ source('siva', 'EMP_STG') }} where updated_at > (select max(updated_at) from {{ this }})
{% else %}
  -- Full refresh logic: select all rows from the source table
  select * from {{ source('siva', 'EMP_STG') }}
{% endif %}