SELECT
  stock,
  "totalCurrentAssets" AS total_current_assets,
  "totalCurrentLiabilities" AS total_current_liabilities,
  "endDate" AS end_date
FROM {{ ref('balanceSheetHistory_annually') }}
