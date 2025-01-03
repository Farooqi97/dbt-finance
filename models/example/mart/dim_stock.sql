WITH dim_stock AS (
    SELECT DISTINCT
        stock AS stock_id,
        stock AS stock_name
    FROM {{ ref('stg_income') }}
)

SELECT
    stock_id,
    stock_name
FROM dim_stock
