import requests
import mysql.connector
from bs4 import BeautifulSoup

mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "password",
    database = "university_covid"
)

mycursor = mydb.cursor()

r = requests.get('https://umanitoba.ca/coronavirus/latest-updates-and-safety')

soup = BeautifulSoup(r.text, 'html.parser')
results = soup.find_all('table')

columns = ['Date Range', 'Number of Cases']
print(columns)
print("Added:")

row = []
i = 0
for p in results[0].find_all('td'):
    if p.find('strong') == None:       
        row.append(p.get_text().strip())
        i += 1
        if i == 2:
            sql = "INSERT INTO manitoba (university_name, date_range, cases) VALUES (%s, %s, %s)"
            val = ("University of Manitoba", str(row[0]), str(row[1]))
            try:
                mycursor.execute(sql, val)
                mydb.commit()
            except:
                row.clear()
                i = 0
                continue
            print(row)
            row.clear()
            i = 0