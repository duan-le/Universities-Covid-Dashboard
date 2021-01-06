import requests
import csv
from bs4 import BeautifulSoup

r = requests.get('https://www.utoronto.ca/utogether/covid19-dashboard')

soup = BeautifulSoup(r.text, 'html.parser')

resultsRow = soup.find_all('table', {'class': 'table table-striped table-bordered'})
dateRanges = resultsRow[0].find_all('div', {'class': 'field field-name-field-updated-date field-type-datetime field-label-hidden'})
communityCases = resultsRow[0].find_all('div', {'class': 'field field-name-field-community-cases field-type-number-integer field-label-hidden'})
campusCases = resultsRow[0].find_all('div', {'class': 'total-outbreaks'})

with open('uoft_covid_cases.csv', 'w', newline='') as csv_file:
    writer  = csv.writer(csv_file)
    columns = ['Date Range', 'Number of Cases in the Community', 'Number of Cases on Campus']
    writer.writerow(columns)

    row = []
    for i in range(0, len(dateRanges)):
        row.append(dateRanges[i].get_text())
        row.append(communityCases[i].get_text())
        row.append(campusCases[i].get_text())
        writer.writerow(row)
        row.clear()
      
        
        
        
        
        
        

