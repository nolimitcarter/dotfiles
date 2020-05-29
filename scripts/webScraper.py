import requests
from bs4 import BeautifulSoup

# Performs HTTP request on website
URL = ""
page = requests.get(URL, headers={"User-agent":"Mozilla/5.0"})

soup = BeautifulSoup(page.content, 'html.parser')
    
# enter specific html element by id: 
results = soup.find(id='')

# print results
print(results.prettify())

# you are also able to fine elements by class name: 
