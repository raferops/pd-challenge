#!/bin/bash

echo "Testing environment..."
echo

#Testing GET method
echo "Testing GET method:"
test=`curl -is -w %{http_code} -X GET http://localhost/notes -o /dev/null`
echo $test
if [ $test = "200" ]; then
   echo "GET method OK!"
   else
      echo "OPS! Something wrong here!"
fi

echo


#Testing POST method
echo "Testing POST method:"
test=`curl -is -w %{http_code} -X POST http://localhost/notes --data {"Text":"JustTestIt"} -o /dev/null`
if [ $test = "200" ]; then
   echo "POST method OK!"
   else
      echo "OPS! Something wrong here!"
fi
echo

#Getting ID of the last POST
DELID=`curl -sX GET http://localhost/notes |  grep -o -E '[0-9]+' | head -n1`

#Testing DELETE method
echo "Testing DELETE method:"
test=`curl -is -w %{http_code} -X DELETE "http://localhost:80/notes/$DELID" -o /dev/null`
if [ $test = "200" ]; then
   echo "DELETE method OK!"
   else
      echo "OPS! Something wrong here!"
fi
echo

echo "All tests done!"
