{{
  config(
    materialized='view'
  )
}}

WITH fraud_data_filtered AS (
    SELECT
        *
    FROM
        {{ ref('fraud_fix') }}
)
SELECT
    datetime,
    senderID,
    amount,
    type,
    oldbalancesend,
    newbalancesend,
    receiverID,
    oldbalancereceive,
    newbalancereceive,
    date,
    isFraud
FROM
    fraud_data_filtered
WHERE 
    amount > 0