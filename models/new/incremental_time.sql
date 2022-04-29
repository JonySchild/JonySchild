 {{config(materialized='incremental', unique_key = 'T_TIME_ID')}}

SELECT  * FROM"SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
WHERE to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) <= CURRENT_TIME()

{% if is_incremental() %}
    AND to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) > (SELECT MAX(to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND))) from {{ this }})
{% endif %}
