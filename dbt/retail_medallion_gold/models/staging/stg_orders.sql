select
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    total_amount
from {{ source('silver', 'silver_orders') }}
