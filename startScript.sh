#!/bin/bash
 echo "starting the script."

 docker-compose up -d

 sleep 30s
 echo "executing cql script for cassandra to get the tables ready"
 docker-compose exec cassandra sh /scripts/initial-script.sh

 echo "kicking off webservice to write data to mysql which ultimately will be replicated to cassandra."

 sleep 10s
 curl http://localhost:8080/demo/start

 sleep 10s
 curl http://localhost:8080/demo/stop

 exit
