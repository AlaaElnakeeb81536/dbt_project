{{ config(materialized='view') }}

select
  customer_id,
  customer_name,
 email,
  country
from {{ ref('stg_customer') }}
