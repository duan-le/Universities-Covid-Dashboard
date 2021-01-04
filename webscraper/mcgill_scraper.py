import requests
import csv
from bs4 import BeautifulSoup

r = requests.get('https://www.mcgill.ca/coronavirus/case-status')

soup = BeautifulSoup(r.text, 'html.parser')
results = soup.find_all('table', {'class': 'no-zebra'})

with open('mcgill_covid_cases.csv', 'w', newline='') as csv_file:
    writer  = csv.writer(csv_file)
    columns = ['Date Range', 'Number of Cases']
    writer.writerow(columns)
    
    row = []
    i = 0
    for p in results[0].find_all('td'):        
        if i != 2:
            print(p.get_text().strip())
            row.append(p.get_text().strip())
            i += 1
        else:
            writer.writerow(row)
            row.clear()
            i = 0