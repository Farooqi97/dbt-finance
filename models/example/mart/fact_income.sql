{{ config(
    unique_key='stock_id'
) }}

WITH dim_stock AS (
    SELECT
        stock_id,
        stock_name
    FROM {{ ref('dim_stock') }} -- Reference the dimension model
),

stg_income AS (
    SELECT
        total_revenue,
        gross_profit,
        ebit,
        interest_expense,
        income_tax_expense,
        cost_of_revenue,
        end_date,
        stock -- Assuming stock exists in stg_income to join with dim_stock
    FROM {{ ref('stg_income') }} -- Reference the staging model
)

SELECT
    s.stock_id,
    s.stock_name,
    i.total_revenue,
    i.gross_profit,
    i.ebit,
    i.interest_expense,
    i.income_tax_expense,
    i.cost_of_revenue,
    i.end_date
FROM dim_stock s
LEFT JOIN stg_income i
    ON s.stock_name = i.stock
