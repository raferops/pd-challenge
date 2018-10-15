#!/bin/bash
#Removing containers, network and volumes
echo
echo "Stoping and removing containers, network and volumes"
docker-compose down -v -t0

#Removing working folders
echo
echo "Removing working folders.."
rm -rf ../app/node_modules
rm -rf ../app/package-lock.json

echo
echo "Done"
