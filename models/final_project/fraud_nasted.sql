{{
    config(
        materialized='table'
    )
}}

WITH fraud_nested AS (
    SELECT
    datetime,
    ARRAY_AGG(STRUCT(
        step,
        type,
        type_nested)) AS timestamp_nested
  FROM (
    SELECT
      datetime,
      step,
      type,
      ARRAY_AGG(STRUCT(senderID,
          oldbalanceSender,
          newbalanceSender,
          difSender,
          receiverID,
          oldbalanceReceive,
          newbalanceReceive,
          difReceiver,
          isFraud,
          isFlaggedFraud)) AS type_nested
    FROM
      {{ ref('src_fraud_data') }}
    GROUP BY
      type,
      step,
      datetime)
  GROUP BY
    datetime
  ORDER BY
    datetime)

SELECT * FROM fraud_nested