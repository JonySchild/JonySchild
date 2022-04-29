SELECT
    SUM(C_ACCTBAL) as Total_C_ACCTBAL
FROM {{ref('playing_with_tests')}}
HAVING  SUM(C_ACCTBAL) < 100000000