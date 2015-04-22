from sys import argv
import requests

response = requests.get(argv[1])
local_copy = open(argv[2], 'w')
local_copy.write(response.text)
local_copy.close()

