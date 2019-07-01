SELECT * FROM (
	SELECT * ,
	Rank () OVER (PARTITION BY id_column ORDER BY column1 DESC, column2) AS [Rank]
	FROM table
) X WHERE Rank=1
