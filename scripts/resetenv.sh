#!/bin/bash

#Removing working folders
echo "Removing working folders.."
rm -rf ../database/db
rm -rf ../app/node_modules
mkdir ../database/db

#Deleting all volumes
echo "Deleting all volumes..."
docker volume prune --force

echo
echo "Done"
