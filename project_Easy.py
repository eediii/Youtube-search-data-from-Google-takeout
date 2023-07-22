import sqlite3
from tqdm import tqdm
import dateutil.parser

Search = "D:/Takeout/YouTube and YouTube Music/history/search-history.html"
conn = sqlite3.connect("Youtube-search-history-withoutID.db")
c = conn.cursor()

def make_table():
    c.execute("CREATE TABLE IF NOT EXISTS words(time int, word varchar(1000))")

def search_data():
    with open(Search, "r", encoding="utf8") as f:
        contents = f.read()
        for item in tqdm(contents.split("Searched for")[1:]):
            try:
                search_string = item.split("\">")[1].split("</a>")[0]
                date = item.split("<br>")[1].split("</div>")[0].replace(" AZT","")
                d = dateutil.parser.parse(date).timestamp()
                #print(date, search_string)

                for w in search_string.split(" "):
                    c.execute("INSERT INTO words(time, word) VALUES (?, ?)", (d, w))
            except Exception as e:
                print(str(e))



make_table()
search_data()
conn.commit()
conn.close()
