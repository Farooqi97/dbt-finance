{{ config(
    unique_key='stock_id'
) }}

WITH dim_stock AS (
    SELECT
        stock_id,
        stock_name
    FROM {{ ref('dim_stock') }} -- Reference the dimension model
),

stg_cashflow AS (
    SELECT
        end_date,
        stock -- Assuming stock exists in stg_cashflow to join with dim_stock
    FROM {{ ref('stg_cashflow') }} -- Reference the staging model
)

SELECT
    s.stock_id,
    s.stock_name,
    c.end_date
FROM dim_stock s
LEFT JOIN stg_cashflow c
    ON s.stock_name = c.stock
