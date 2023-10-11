# The following python code sets a custom header and sends a request to the web server to retrieve index.php. The IP address was obtained from an Ubuntu OS running Nginx on a Linode web server
# The purpose of this was to test whether the pre-set custom headers are correctly blocked


import requests
from bs4 import BeautifulSoup

url = "http://213.52.128.13/"
headers = {'User-Agent':"BlockedPythonUA"}  # Custom header

r = requests.get(url, headers=headers)  # Obtaining index.php
doc = BeautifulSoup(r.text, "html.parser")  # Storing the HTML response
print(doc)