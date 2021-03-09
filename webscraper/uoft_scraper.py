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
    dateStringList = row[0].split('to');
    dateStringList2 = dateStringList[0].split()
    dateString = ''
    if (dateStringList2[0].strip('.') in 'January'):
        dateString = dateStringList2[1] + '-1-2021'
    elif (dateStringList2[0].strip('.') in 'February'):
        dateString = dateStringList2[1] + '-2-2021'
    elif (dateStringList2[0].strip('.') in 'March'):
        dateString = dateStringList2[1] + '-3-2020'
    elif (dateStringList2[0].strip('.') in 'April'):
        dateString = dateStringList2[1] + '-4-2020'
    elif (dateStringList2[0].strip('.') in 'May'):
        dateString = dateStringList2[1] + '-5-2020'
    elif (dateStringList2[0].strip('.') in 'June'):
        dateString = dateStringList2[1] + '-6-2020'
    elif (dateStringList2[0].strip('.') in 'July'):
        dateString = dateStringList2[1] + '-7-2020'
    elif (dateStringList2[0].strip('.') in 'August'):
        dateString = dateStringList2[1] + '-8-2020'
    elif (dateStringList2[0].strip('.') in 'September'):
        dateString = dateStringList2[1] + '-9-2020'
    elif (dateStringList2[0].strip('.') in 'October'):
        dateString = dateStringList2[1] + '-10-2020'
    elif (dateStringList2[0].strip('.') in 'November'):
        dateString = dateStringList2[1] + '-11-2020'
    elif (dateStringList2[0].strip('.') in 'December'):
        dateString = dateStringList2[1] + '-12-2020'
    sql = "INSERT INTO ontario (university_name, date_range, cases) VALUES (%s, %s, %s)"
    val = ("University of Toronto", dateString, str(int(row[1]) + int(row[2])))
    try:
        mycursor.execute(sql, val)
        mydb.commit()
    except:
        row.clear()
        continue
    print(row)
    row.clear()