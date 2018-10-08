#!/bin/bash

test=`curl -Is -w %{http_code} -X GET http://ip172-18-0-24-betqvfqv9dig00dia2vg-80.direct.labs.play-with-docker.com/notes |tail -n1`
echo $test
if [ $test="200%" ]; then
    echo "Webserver OK!"
else
    echo "Something wrong"
fi
