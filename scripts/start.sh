#!/bin/bash

# Initializing containers Environment
docker-compose up -d

echo
echo -ne "Starting up... " # && sleep 5 && echo -ne "3... " && sleep 5 && echo -ne "2... " && sleep 5 && echo -ne "1... " && sleep 5 && echo "DONE!"
CHECK=`curl -is -w %{http_code} -X GET http://localhost/notes -o /dev/null`

while [ $CHECK != 200 ] 
do
 echo -ne "."
 CHECK=`curl -is -w %{http_code} -X GET http://localhost/notes -o /dev/null`
 sleep 1
done

echo "Started!"

echo

sleep 1
echo "Testing environment..."
echo
#Testing GET method
echo "Testing Webserver status:"
test=`curl -is -w %{http_code} -X GET http://localhost/notes -o /dev/null`
echo $test
if [ $test = "200" ]; then
   echo "Webserver OK!"
   else
      echo "Something wrong here"
      exit 1
fi
echo

sleep 1
#Testing POST method
echo "Testing POST method:"
test=`curl -is -w %{http_code} -X POST http://localhost/notes --data {"Text":"JustTestIt"} -o /dev/null`
if [ $test = "200" ]; then
   echo "POST method OK!"
   else
      echo "Something wrong here"
      exit 1
fi
echo

sleep 1
#Getting ID of the last POST
DELID=`curl -sX GET http://localhost/notes |  grep -o -E '[0-9]+' | head -n1`

#Testing DELETE method
echo "Testing DELETE method:"
test=`curl -is -w %{http_code} -X DELETE "http://localhost:80/notes/$DELID" -o /dev/null`
if [ $test = "200" ]; then
   echo "POST method OK!"
   else
      echo "Something wrong here"
      exit 1
fi
echo

echo
echo "All tests passed!"
echo
echo "Start up proccess complete successfully!"
