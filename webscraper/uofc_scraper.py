import requests
import csv
from bs4 import BeautifulSoup

r = requests.get('https://ucalgary.ca/risk/emergency-management/covid-19-response/covid-19-dashboard')

soup = BeautifulSoup(r.text, 'html.parser')
results = soup.find_all('div', {'class': 'layout-blocks-ucws-text container-fluid roundable block text'})
results = results[2].find_all('div', {'class': 'col-sm-12 one-col'})
results = results[0].find_all('p')

with open('uofc_covid_cases.csv', 'w', newline='') as csv_file:
    writer  = csv.writer(csv_file)
    columns = ['Date', 'Location']
    writer.writerow(columns)
    
    for p in results:
        if p.find('strong') != None:
            p.strong.decompose()
        
        rows = p.get_text().strip().replace('notification:', '|').replace('Read more.', '').replace('Read More.', '').replace(u'\xa0', ' ').split('\n')
    
        for row in rows:
            row = row.split('|')
            if len(row) == 2:
                row[0] = row[0].strip()
                row[1] = row[1].strip().strip('.')
                writer.writerow(row)
                print(row)
