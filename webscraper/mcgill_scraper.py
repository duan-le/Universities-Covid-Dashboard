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

r = requests.get('https://www.mcgill.ca/coronavirus/case-status')

soup = BeautifulSoup(r.text, 'html.parser')
results = soup.find_all('table', {'class': 'no-zebra'})

columns = ['Date Range', 'Number of Cases']
print(columns)
print("Added:")
    
row = []
i = 0
for p in results[0].find_all('td'):        
    if i != 2:
        row.append(p.get_text().strip())
        i += 1
    else:
        dateStringList = row[0].split('-');
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
        sql = "INSERT INTO quebec (university_name, date_range, cases) VALUES (%s, %s, %s)"   
        val = ("McGill University", dateString, str(row[1]))
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