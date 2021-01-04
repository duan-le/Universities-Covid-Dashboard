import requests
import csv
from bs4 import BeautifulSoup

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
                writer.writerow(row)
                row.clear()
                i = 0