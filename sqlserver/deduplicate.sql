SELECT * FROM (
	SELECT * ,
	Rank () OVER (PARTITION BY id_column ORDER BY column1 DESC, column2) AS [Rank]
	FROM table
) X WHERE Rank=1


------------------------------------------------------------------------
--alternative
WITH cte AS (
  SELECT PROCOD, TESCOD, DATACOD, 
     row_number() OVER(PARTITION BY PROCOD, TESCOD, DATACOD ORDER BY DATACOD) AS [rn]
  FROM DW_ESTOQUE_RESUMO
)

DELETE cte WHERE [rn] > 1
