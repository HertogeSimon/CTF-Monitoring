#!/bin/sh

username="test"
password="test"
url="http://localhost:8000"

request="$(curl -i "${url}/login" 2>/dev/null | sed 's/\r//g')"
session="$(echo "$request" | grep session | sed 's/.*session=\([^;]*\);.*/\1/g')"
nonce="$(echo "$request" | grep nonce | tail -n1 | sed 's/.*value=\"\(.*\)\".*/\1/g')"
login="$(curl -i "${url}/login" -H "Cookie: session=$session" --data "name=${username}&password=${password}&nonce=$nonce" 2>/dev/null)"
admin_session="$(echo "$login" | grep session | sed 's/.*session=\([^;]*\);.*/\1/g')"

echo "- type: http
  schedule: '@every 10s'
  check.response.status: 200
  urls:" > docker/heartbeat/monitors/ctfd.yml

challenge_ids="$(curl "${url}/api/v1/challenges" -H "Cookie: session=$admin_session" 2>/dev/null | jq '.data[].id')"
for id in $challenge_ids
do
    urls="$(curl "${url}/api/v1/challenges/$id" -H "Cookie: session=$admin_session" 2>/dev/null | jq '.data.description' | grep -Po ']\(http.*?\)' | sed 's/](\(.*\))/\1/g' | sed '/^$/d')"
    for url in $(echo $urls)
    do
        echo "    - \"$url\"" >> docker/heartbeat/monitors/ctfd.yml
    done
done


