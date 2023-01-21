{{ config(materialized='table') }}

with dbt_raw as (
select status, count(*)
from RAW.DB_RC_FREIGHTS.FREIGHT
where created_at > '2022-06-01'
group by status
)

select * 
from dbt_raw
