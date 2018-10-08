#!/bin/bash

docker-compose up -d

echo
echo -ne "Starting up..." && sleep 3 && echo "3" && sleep 3 && echo "2" && sleep 3 && echo "1" && sleep 3



echo "Testing environment..."
echo
echo "Testing Webserver status:"
test=`curl -Is -w %{http_code} -X GET http://localhost/notes -o /dev/null`
echo $test
if [ $test = "200" ]; then
   echo "Webserver OK!"
   else
      echo "Something wrong here"
      exit 1
fi

echo

echo "Testing POST method:"
test=`curl -sX POST http://localhost/notes --data {"Text":"test123"}`
if [ $test = "Ok" ]; then
   echo "POST method OK!"
   else
      echo "Something wrong here"
      exit 1
fi
