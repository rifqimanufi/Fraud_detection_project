{{
  config(
    materialized='view'
  )
}}

WITH fraud_data_customer AS (
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
    fraud_data_customer
WHERE 
    isFraud = 1