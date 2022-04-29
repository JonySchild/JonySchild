 {{config(materialized='incremental', unique_key = 'd_date')}}

SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF100TCL.date_dim
WHERE d_date <= current_date()

{% if is_incremental() %}
    and d_date > (SELECT max(d_date) from {{ this }})
{% endif %}

