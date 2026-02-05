select
    customer_id,
    first_name,
    last_name,
    email,
    country
from {{ source('silver', 'silver_customers') }}
