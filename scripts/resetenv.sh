#!/bin/bash
#Removing containers, network and volumes
echo
echo "Stoping and removing containers, network and volumes"
docker-compose down -v

#Removing working folders
echo
echo "Removing working folders.."
rm -rf ../database/db
rm -rf ../app/node_modules
mkdir ../database/db

echo
echo "Done"
