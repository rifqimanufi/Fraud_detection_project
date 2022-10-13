{{
    config(
        materialized='table',
        partition_by={
            'field': 'date',
            'data_type': 'date',
            'granularity': 'day'
        }
    )
}}

  SELECT
    date,
    isFraud
  FROM
    {{ ref('fraud_fix') }}