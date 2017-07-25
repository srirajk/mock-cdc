#!/bin/bash
 echo "starting the script."

 docker-compose up -d

 sleep 50s

 docker-compose exec cassandra sh /scripts/initial-script.sh

 exit
