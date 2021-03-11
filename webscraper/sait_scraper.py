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

sql = "DELETE FROM alberta WHERE university_name = 'Southern Alberta Institute of Technology'"
mycursor.execute(sql)
mydb.commit()

r = requests.get('https://www.sait.ca/about-sait/administration/departments/health-safety-and-environment-services/pandemic-response/covid-tracking')

soup = BeautifulSoup(r.text, 'html.parser')
results = soup.find_all('div', {'class': 'g-tab-content'})

counter = len(results)

for result in results:
    result = result.find('table', {'class': 'g-table'})
    result = result.find('tbody')
    rows = result.find_all('tr')

    year = '2021'
    if (counter <= 3):
        year = '2020'

    for row in rows:
        row = row.find_all('td')
        row[0] = row[0].get_text().strip()
        row[3] = row[3].get_text().strip()
        dateStringList = row[0].split();
        dateString = ''
        if (dateStringList[0].strip('.') in 'January'):
            dateString = dateStringList[1] + '-1-' + year
        elif (dateStringList[0].strip('.') in 'February'):
            dateString = dateStringList[1] + '-2-' + year
        elif (dateStringList[0].strip('.') in 'March'):
            dateString = dateStringList[1] + '-3-' + year
        elif (dateStringList[0].strip('.') in 'April'):
            dateString = dateStringList[1] + '-4-' + year
        elif (dateStringList[0].strip('.') in 'May'):
            dateString = dateStringList[1] + '-5-' + year
        elif (dateStringList[0].strip('.') in 'June'):
            dateString = dateStringList[1] + '-6-' + year
        elif (dateStringList[0].strip('.') in 'July'):
            dateString = dateStringList[1] + '-7-' + year
        elif (dateStringList[0].strip('.') in 'August'):
            dateString = dateStringList[1] + '-8-' + year
        elif (dateStringList[0].strip('.') in 'September'):
            dateString = dateStringList[1] + '-9-' + year
        elif (dateStringList[0].strip('.') in 'October'):
            dateString = dateStringList[1] + '-10-' + year
        elif (dateStringList[0].strip('.') in 'November'):
            dateString = dateStringList[1] + '-11-' + year
        elif (dateStringList[0].strip('.') in 'December'):
            dateString = dateStringList[1] + '-12-' + year
        sql = "INSERT INTO alberta (university_name, date_range, cases) VALUES (%s, %s, %s)"
        val = ("Southern Alberta Institute of Technology", dateString, str(1))
        try:
            mycursor.execute(sql, val)
            mydb.commit()
        except:
            sql2 = "SELECT cases FROM alberta WHERE university_name = 'Southern Alberta Institute of Technology' AND date_range = '%s'" % (dateString)
            mycursor.execute(sql2)
            selectResult = mycursor.fetchall()
            sql3 = "UPDATE alberta SET cases = '%s' WHERE university_name = 'Southern Alberta Institute of Technology' AND date_range = '%s'" % (str(int(selectResult[0][0]) + 1), dateString)
            mycursor.execute(sql3)
            mydb.commit()
            continue
    
    counter -= 1