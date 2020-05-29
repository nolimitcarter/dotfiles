import requests
from bs4 import BeautifulSoup

# Performs HTTP request on website
URL = "https://cartert.dev"
page = requests.get(URL)

soup = BeautifulSoup(page.content, 'html.parser')
    
results = soup.find(id='')

print(results.prettify())

