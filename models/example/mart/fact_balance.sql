{{ config(
    unique_key='stock_id'
) }}

WITH dim_stock AS (
    SELECT
        stock_id,
        stock_name
    FROM {{ ref('dim_stock') }} -- Reference the dimension model
),

stg_balance AS (
    SELECT
        total_current_assets,
        total_current_liabilities,
        end_date,
        stock -- Assuming stock exists in stg_balance to join with dim_stock
    FROM {{ ref('stg_balance') }} -- Reference the staging model
)

SELECT
    s.stock_id,
    s.stock_name,
    b.total_current_assets,
    b.total_current_liabilities,
    b.end_date
FROM dim_stock s
LEFT JOIN stg_balance b
    ON s.stock_name = b.stock
