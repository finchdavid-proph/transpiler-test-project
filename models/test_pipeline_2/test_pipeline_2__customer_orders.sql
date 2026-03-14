{{
  config({    
    "materialized": "ephemeral",
    "database": "prophecy-field",
    "schema": "nadeesh_demos"
  })
}}

WITH orders AS (

  SELECT * 
  
  FROM {{ source('prophecy_field_abhinav_demos', 'orders') }}

),

customers AS (

  SELECT * 
  
  FROM {{ source('prophecy_field_abhinav_demos', 'customers') }}

),

Join_1 AS (

  {#Combines customer profiles with their order details for a complete view of customer activity.#}
  SELECT 
    in0.customer_id AS customer_id,
    in0.first_name AS first_name,
    in0.last_name AS last_name,
    in0.phone AS phone,
    in0.email AS email,
    in0.country_code AS country_code,
    in0.account_open_date AS account_open_date,
    in0.account_flags AS account_flags,
    in1.order_id AS order_id,
    in1.order_status AS order_status,
    in1.order_category AS order_category,
    in1.order_date AS order_date,
    in1.amount AS amount
  
  FROM customers AS in0
  INNER JOIN orders AS in1
     ON in1.customer_id = in0.customer_id

),

customer_orders AS (

  {#Lists each customer's orders with their dates for tracking purchase activity.#}
  SELECT 
    customer_id AS customer_id,
    order_id AS order_id,
    order_date AS order_date
  
  FROM Join_1 AS in0

)

SELECT *

FROM customer_orders
