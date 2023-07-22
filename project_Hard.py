import sqlite3
from tqdm import tqdm

Search = "D:/Takeout/YouTube and YouTube Music/history/search-history.html"
conn = sqlite3.connect("Youtube-search-history.db")
c = conn.cursor()

def make_table():
    c.execute("CREATE TABLE IF NOT EXISTS words(id INTEGER PRIMARY KEY, time REAL, word TEXT)")

def search_data():
    with open(Search, "r", encoding="utf8") as f:
        contents = f.read()
        for item in tqdm(contents.split("Searched for")[1:]):
            try:
                search_string = item.split("\">")[1].split("</a>")[0]
                date = item.split("<br>")[1].split("</div>")[0].replace(" AZT","")
                #print(date, search_string)

                for w in search_string.split(" "):
                    c.execute("INSERT INTO words(time, word) VALUES (?, ?)", (date, w))
            except Exception as e:
                print(str(e))


make_table()
search_data()
conn.commit()
conn.close()
