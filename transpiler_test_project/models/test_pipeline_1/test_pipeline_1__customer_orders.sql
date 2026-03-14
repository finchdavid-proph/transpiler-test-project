{{
  config({    
    "materialized": "ephemeral"
  })
}}

WITH src_customers AS (
  SELECT * 
  
  FROM {{ source('prophecy_field_abhinav_demos', 'customers') }}
)

SELECT * FROM src_customers
