WITH fraud_dataset_fix AS (
    SELECT
        *
    FROM
       {{ source('fraud_dataset', 'fraud_dataset_final') }}
)
SELECT type,
  amount,
  nameOrig AS senderID,
  oldbalanceOrg AS oldbalanceSend,
  newbalanceOrig AS newbalanceSend,
  abs(newbalanceOrig-oldbalanceOrg) AS difsender,
  nameDest AS receiverID,
  oldbalanceDest AS oldbalancereceive,
  newbalanceDest AS newbalancereceive,
  abs(newbalanceDest-oldbalanceDest) AS difreceiver,
  isFraud,
  isFlaggedFraud,
  datetime,
  extract(date from datetime) AS date,
  extract(time from datetime) AS time
  FROM fraud_dataset_fix
  ORDER BY datetime