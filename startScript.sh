#!/bin/bash
 echo "starting the script."

 docker-compose up -d

 sleep 30s

 docker-compose ps

 echo "executing cql script for cassandra to get the tables ready"
 docker-compose exec cassandra sh /scripts/initial-script.sh

exit
