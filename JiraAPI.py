import requests
import json
import io

url="https://ccp.sys.comcast.net/rest/api/2/issue/DELIA-49204"

headers={
  "Accept": "application/json",
    "Content-Type": "application/json"
}


response=requests.get(url,headers=headers,auth=("dp004","Hacker#46"))
data=response.json()

print(data["fields"]["assignee"]["displayName"])
