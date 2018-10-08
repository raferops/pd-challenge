#!/bin/bash

docker-compose up -d

wait

echo
echo -ne "Starting up... " && sleep 5 && echo -ne "3... " && sleep 5 && echo -ne "2... " && sleep 5 && echo -ne "1.. " && sleep 5 && echo "DONE!"
echo


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
echo "All tests passed!"
echo
echo "Start up proccess complete successfully!"
