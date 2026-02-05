select
    customer_id,
    first_name,
    last_name,
    email,
    country
from {{ ref('stg_customers') }}
