#!/bin/bash
 echo "starting the HTTP services for loading in data."




curl  -d @./nifi/nifi-templates/mysql_-_kafka.xml -H 'Content-Type: application/xml' -X POST http://localhost:9000/nifi-api/process-groups/root/templates/import

curl  -d @./nifi/nifi-templates/kafka_-_cassandra.xml -H 'Content-Type: application/xml' -X POST http://localhost:9000/nifi-api/process-groups/root/templates/import


curl http://localhost:8080/demo/start

sleep 10s

curl http://localhost:8080/demo/stop
