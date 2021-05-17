import requests
import json
import io

url="https://ccp.sys.comcast.net/rest/api/2/issue/-IssueID-"

headers={
  "Accept": "application/json",
    "Content-Type": "application/json"
}


response=requests.get(url,headers=headers,auth=("username","Password"))
data=response.json()

print(data["fields"]["assignee"]["displayName"])
