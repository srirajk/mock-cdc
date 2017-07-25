#!/bin/bash
 echo "starting the HTTP services for loading in data."



 curl http://localhost:8080/demo/start

 sleep 10s
 curl http://localhost:8080/demo/stop
