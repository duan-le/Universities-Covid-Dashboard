import requests
import mysql.connector
import csv
from bs4 import BeautifulSoup

mydb = mysql.connector.connect(
  host = "localhost",
  user = "root",
  password = "password",
  database = "covid_database"
)

mycursor = mydb.cursor()

r = requests.get('https://umanitoba.ca/coronavirus/latest-updates-and-safety')

soup = BeautifulSoup(r.text, 'html.parser')
results = soup.find_all('table')

with open('uofm_covid_cases.csv', 'w', newline='') as csv_file:
    writer  = csv.writer(csv_file)
    columns = ['Date Range', 'Number of Cases']
    writer.writerow(columns)

    row = []
    i = 0
    for p in results[0].find_all('td'):
        if p.find('strong') == None:       
            row.append(p.get_text().strip())
            i += 1
            if i == 2:
                print(row)
                sql = "INSERT INTO umanitoba (uni_Name, cdate, cases) VALUES (%s, %s, %s)"
                val = ("University of Manitoba", str(row[0]), str(row[1]))
                mycursor.execute(sql, val)
                mydb.commit()
                writer.writerow(row)
                row.clear()
                i = 0