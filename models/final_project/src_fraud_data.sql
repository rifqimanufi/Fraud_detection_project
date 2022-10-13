{{
    config(
        materialized="view"
    )
}}
WITH fraud_dataset_src AS (
    SELECT
        *
    FROM
       {{ source('fraud_dataset', 'fraud_dataset_final') }}
)
SELECT
  step,
  type,
  amount,
  nameOrig as senderID,
  nameDest as receiverID,
  oldbalanceOrg as oldbalanceSender,
  newbalanceOrig as newbalanceSender,
  (newbalanceOrig-oldbalanceOrg) as difSender,
  oldbalanceDest as oldbalanceReceive,
  newbalanceDest as newbalanceReceive,
  (newbalanceDest-oldbalanceDest) as difReceiver,
  isFraud,
  isFlaggedFraud,
  datetime
FROM fraud_dataset_src
ORDER BY datetime ASC