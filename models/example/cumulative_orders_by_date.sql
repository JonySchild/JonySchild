


 
select
    o_orderdate
    ,sum(o_totalprice) TotalPrice
    ,sum(totalPrice) over (order by o_orderdate) as cumulative_sales
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
GROUP BY o_orderdate
ORDER BY o_orderdate