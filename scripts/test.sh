#!/bin/bash

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
echo
echo "Testing DELETE method:"
test=`curl -i -X "DELETE" "http://localhost:80/notes/1"`
if [ $test = "Ok" ]; then
   echo "POST method OK!"
   else
      echo "Something wrong here"
      exit 1
fi
echo

echo "All tests passed!"
