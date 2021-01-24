import requests
import mysql.connector
import csv
from bs4 import BeautifulSoup

mydb = mysql.connector.connect(
  host = "localhost",
  user = "root",
  password = "password",
  database = "university_covid"
)

mycursor = mydb.cursor()

r = requests.get('https://www.utoronto.ca/utogether/covid19-dashboard')

soup = BeautifulSoup(r.text, 'html.parser')

resultsRow = soup.find_all('table', {'class': 'table table-striped table-bordered'})
dateRanges = resultsRow[0].find_all('div', {'class': 'field field-name-field-updated-date field-type-datetime field-label-hidden'})
communityCases = resultsRow[0].find_all('div', {'class': 'field field-name-field-community-cases field-type-number-integer field-label-hidden'})
campusCases = resultsRow[0].find_all('div', {'class': 'total-outbreaks'})

columns = ['Date Range', 'Number of Cases in the Community', 'Number of Cases on Campus']
print(columns)
print("Added:")
row = []
for i in range(0, len(dateRanges)):
    row.append(dateRanges[i].get_text())
    row.append(communityCases[i].get_text())
    row.append(campusCases[i].get_text())
    sql = "INSERT INTO ontario (university_name, date_range, cases) VALUES (%s, %s, %s)"
    val = ("University of Toronto", str(row[0]), str(int(row[1]) + int(row[2])))
    try:
        mycursor.execute(sql, val)
        mydb.commit()
    except:
        row.clear()
        continue
    print(row)
    row.clear()