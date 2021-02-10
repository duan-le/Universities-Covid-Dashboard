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
            dateStringList =  row[0].split('-');
            dateStringList2 = dateStringList[0].split()
            dateString = ''
            if (dateStringList2[0] == 'Jan.' or dateStringList2[0] == 'January'):
                dateString = dateStringList2[1] + '-1-2021'
            elif (dateStringList2[0] == 'Feb.' or dateStringList2[0] == 'February'):
                dateString = dateStringList2[1] + '-2-2021'
            elif (dateStringList2[0] == 'Mar.' or dateStringList2[0] == 'March'):
                dateString = dateStringList2[1] + '-3-2020'
            elif (dateStringList2[0] == 'Apr.' or dateStringList2[0] == 'April'):
                dateString = dateStringList2[1] + '-4-2020'
            elif (dateStringList2[0] == 'May.' or dateStringList2[0] == 'May'):
                dateString = dateStringList2[1] + '-5-2020'
            elif (dateStringList2[0] == 'Jun.' or dateStringList2[0] == 'June'):
                dateString = dateStringList2[1] + '-6-2020'
            elif (dateStringList2[0] == 'Jul.' or dateStringList2[0] == 'July'):
                dateString = dateStringList2[1] + '-7-2020'
            elif (dateStringList2[0] == 'Aug.' or dateStringList2[0] == 'August'):
                dateString = dateStringList2[1] + '-8-2020'
            elif (dateStringList2[0] == 'Sep.' or dateStringList2[0] == 'September'):
                dateString = dateStringList2[1] + '-9-2020'
            elif (dateStringList2[0] == 'Oct.' or dateStringList2[0] == 'October'):
                dateString = dateStringList2[1] + '-10-2020'
            elif (dateStringList2[0] == 'Nov.' or dateStringList2[0] == 'November'):
                dateString = dateStringList2[1] + '-11-2020'
            elif (dateStringList2[0] == 'Dec.' or dateStringList2[0] == 'December'):
                dateString = dateStringList2[1] + '-12-2020'
            elif (dateStringList2[0] == 'Prior'):
                dateString = '1-10-2020'
            sql = "INSERT INTO manitoba (university_name, date_range, cases) VALUES (%s, %s, %s)"
            val = ("University of Manitoba", dateString, str(row[1]))
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