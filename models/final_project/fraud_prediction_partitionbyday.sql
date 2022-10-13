{{
    config(
        materialized='table',
        partition_by={
            'field': 'date',
            'data_type': 'date',
            'granularity': 'day'
        },
        cluster_by = 'type'
    )
}}

  SELECT
    date,
    type,
    isFraud,
    isFlaggedFraud
  FROM
    {{ ref('fraud_fix') }}