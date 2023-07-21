--1.I didn't like CTEs because you have to select CTE too, but you can do also this way.
WITH CTEforString AS(
SELECT time, STRING_AGG(CONVERT(varchar(100),word), ' ') AS combined_keywords
FROM words
GROUP BY time
)

SELECT w.id, s.time, s.combined_keywords
FROM words as w
JOIN CTEforString as s
	ON s.time = w.time
ORDER BY w.id

--2.I made temp table for not selecting also it as CTE.
DROP TABLE IF EXISTS #temptable
CREATE TABLE #temptable(
Time varchar(100),
words text
)

INSERT INTO #temptable
SELECT time, STRING_AGG(CONVERT(nvarchar(255),word), ' ') AS combined_keywords
FROM words
GROUP BY time

--3.Main table but with duplicates, added id.
DROP TABLE IF EXISTS #main
CREATE TABLE #main(
ID int,
Date varchar(100),
Searchs text
)

INSERT INTO #main
SELECT w.id, s.time, s.words
FROM words as w
JOIN #temptable as s
	ON s.time = w.time

--4.Deleting dublicates.
WITH RepeatingCTE AS(
SELECT *, ROW_NUMBER() OVER(PARTITION BY Date ORDER BY ID) as Repeating
FROM #main
)
DELETE
FROM RepeatingCTE
WHERE Repeating > 1

--5.True row numbers for ordering right.
WITH MainCte AS(
SELECT ROW_NUMBER() OVER(ORDER BY ID) AS ID,
  Date,
  Searchs
FROM #main
)

SELECT Date, Searchs
FROM MainCte
ORDER BY ID
