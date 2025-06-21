{{ config(materialized='table') }}

select
  stg_order.order_id,
  stg_order.order_date,
  dim_customer.customer_name,
  dim_product.product_name,
  stg_orderitems.quantity,
  stg_orderitems.unit_price,
  stg_orderitems.total_price
from {{ ref('stg_order') }} as stg_order
left join {{ ref('stg_orderitems') }} as stg_orderitems
  on stg_order.order_id = stg_orderitems.order_id
left join {{ ref('dim_customer') }} as dim_customer
  on stg_order.customer_id = dim_customer.customer_id
left join {{ ref('dim_product') }} as dim_product
  on stg_orderitems.product_id = dim_product.product_id
