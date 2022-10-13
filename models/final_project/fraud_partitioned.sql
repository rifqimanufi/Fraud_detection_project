{{
    config(
        materialized='table',
        partition_by={
            'field': 'datetime',
            'data_type': 'timestamp',
            'granularity': 'hour'
        },
        cluster_by = 'type'
    )
}}

  SELECT
    *
  FROM
    {{ ref('src_fraud_data') }}