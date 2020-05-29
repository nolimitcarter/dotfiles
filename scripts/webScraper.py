import requests
from bs4 import BeautifulSoup

# Performs HTTP request on website
URL = "https://cartert.dev"
page = requests.get(URL)

soup = BeautifulSoup(page.content, 'html.parser')
    
# enter specific html element by id: 
results = soup.find(id='')

# print results
print(results.prettify())

# you are also able to fine elements by class name: 
# ex: job_elems = results.find.all('section', class_='card-content')
