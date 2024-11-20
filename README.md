# Google takeout data analyzing in easy and hard ways(at least for me).

[db.png](https://github.com/eediii/Youtube-search-data-from-Google-takeout/blob/main/db.png) is to let you see what happens after starting project.py. I mean, Youtube-search-history.db was created. And if you want to use this database at Windows SQL Server then you have to convert it to .sql file. I did this by downloading DB Browser. I learned it from [here](https://stackoverflow.com/a/41802847).

[example pdf.jpg](https://github.com/eediii/Youtube-search-data-from-Google-takeout/blob/main/example%20pdf.jpg) is a piece of my data after i import it as pdf.

[html.jpg](https://github.com/eediii/Youtube-search-data-from-Google-takeout/blob/main/html.jpg) is a screenshoot of my data that i took from Google takeout.

[excel.png](https://github.com/eediii/Youtube-search-data-from-Google-takeout/blob/main/excel.png) is an Excel sheet with pivot table and other things.

[excel data.png](https://github.com/eediii/Youtube-search-data-from-Google-takeout/blob/main/excel%20data.png) is a part of my data that i exported from [YoutubeSearchData_Easy.sql](https://github.com/eediii/Youtube-search-data-from-Google-takeout/blob/main/YoutubeSearchData_Easy.sql). Formula that i used in HumanDate column is =((A2+(4*60*60))/86400)+DATE(1970,1,1). I added +(4*60*60) part because i wanted to convert it into Azerbaijani time.

[YoutubeSearchData_Hard.sql](https://github.com/eediii/Youtube-search-data-from-Google-takeout/blob/main/YoutubeSearchData_Hard.sql) and [project_Hard.py](https://github.com/eediii/Youtube-search-data-from-Google-takeout/blob/main/project_Hard.py) is for table that there is ID in it and honestly i made it for some experience.

[YoutubeSearchData_Easy.sql](https://github.com/eediii/Youtube-search-data-from-Google-takeout/blob/main/YoutubeSearchData_Easy.sql) and [project_Easy.py](https://github.com/eediii/Youtube-search-data-from-Google-takeout/blob/main/project_Easy.py) is normal codes for normal people without ID:)

And i am so grateful to [sentdex](https://www.youtube.com/channel/UCfzlCWGWYyIQ0aLC5w48gBQ) from Youtube. I copied all project.py from his [video](https://www.youtube.com/watch?v=Siyg1Wn5VDs)
