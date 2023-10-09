import requests
from bs4 import BeautifulSoup

url = "http://213.52.128.13/"
headers = {'User-Agent':"BlockedPythonUA"}

r = requests.get(url, headers=headers)
doc = BeautifulSoup(r.text, "html.parser")
print(doc)