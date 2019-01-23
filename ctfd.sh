#!/bin/sh
request="$(curl -i "http://localhost:8000/login" 2>/dev/null | sed 's/\r//g')"
session="$(echo "$request" | grep session | sed 's/.*session=\([^;]*\);.*/\1/g')"
nonce="$(echo "$request" | grep nonce | tail -n1 | sed 's/.*value=\"\(.*\)\".*/\1/g')"
login="$(curl -i "http://localhost:8000/login" -H "Cookie: session=$session" --data "name=admin&password=admin&nonce=$nonce" 2>/dev/null)"
admin_session="$(echo "$login" | grep session | sed 's/.*session=\([^;]*\);.*/\1/g')"

challenge_ids="$(curl "http://localhost:8000/api/v1/challenges" -H "Cookie: session=$admin_session" 2>/dev/null | jq '.data[].id')"
for id in $challenge_ids
do
    curl "http://localhost:8000/api/v1/challenges/$id" -H "Cookie: session=$admin_session" 2>/dev/null | jq '.data.description' | grep -Po ']\(http.*?\)' | sed 's/](\(.*\))/\1/g' | sed '/^$/d'
done

