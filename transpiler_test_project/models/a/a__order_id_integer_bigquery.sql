{{
  config({    
    "materialized": "table",
    "alias": "test_2",
    "database": "prophecy-field",
    "schema": "abhinav_demos"
  })
}}

WITH customers AS (

  SELECT * 
  
  FROM {{ source('prophecy_field_abhinav_demos', 'customers') }}

),

orders AS (

  SELECT * 
  
  FROM {{ source('prophecy_field_abhinav_demos', 'orders') }}

),

order_join_query AS (

  {#Identifies orders linked to customers by joining customer and order data.#}
  SELECT in1.order_id AS order_id
  
  FROM customers AS in0
  INNER JOIN orders AS in1
     ON in1.customer_id = in0.customer_id

)

SELECT *

FROM order_join_query
