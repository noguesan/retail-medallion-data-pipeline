select
    o.order_id,
    o.order_date,
    o.customer_id,
    o.product_id,
    o.quantity,
    o.total_amount
from {{ ref('stg_orders') }} o
