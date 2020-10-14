import json

with open('D:\Python Testing\query builder\sample.json') as f:
  data = json.load(f)

print(data["dimensions"]["process_segment"]["name"]["values"])

keylist =[]
keylist = data["dimensions"].keys()
print(keylist)
#s = "select "+ data["dimensions"].keys() + data["dimensions"]["process_segment"]["name"]
#print(s)
