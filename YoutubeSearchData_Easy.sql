DROP TABLE IF EXISTS YoutubeSearchData
CREATE TABLE YoutubeSearchData(
Date int,
SearchedData varchar(1000)
)

INSERT INTO YoutubeSearchData
SELECT time, STRING_AGG(SearchedData, ' ') AS combined_keywords
FROM words
GROUP BY time
ORDER BY time desc OFFSET 0 ROWS

SELECT *
FROM YoutubeSearchData
