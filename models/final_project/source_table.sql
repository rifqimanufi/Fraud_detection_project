{{
    config(
        materialized="view"
    )
}}

SELECT * FROM `strategic-kite-363002.fraud_dataset.fraud_dataset_final`
ORDER BY datetime, step