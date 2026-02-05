select
    product_id,
    product_name,
    category,
    price
from {{ source('silver', 'silver_products') }}
