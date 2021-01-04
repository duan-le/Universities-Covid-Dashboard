import requests
from bs4 import BeautifulSoup

r = requests.get('https://ucalgary.ca/risk/emergency-management/covid-19-response/covid-19-dashboard')

soup = BeautifulSoup(r.text, 'html.parser')
results = soup.find_all('div', {'class': 'layout-blocks-ucws-text container-fluid roundable block text'})
results = results[2].find_all('div', {'class': 'col-sm-12 one-col'})
results = results[0].find_all('p')

for p in results:
    new_string = p.text.replace('notification', '').replace('Read more.', '').replace('Read More.', '').replace(u'\xa0', ' ').strip()
    print(new_string)
