select
    id as customer_id,
    first_name,
    last_name
from {{ source('lake', 'raw_customers') }} 
