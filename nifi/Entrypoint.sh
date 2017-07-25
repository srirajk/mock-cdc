#!/bin/bash

mvn dependency:get -DrepoUrl=http://repo.maven.apache.org/maven2/ -Dartifact=mysql:mysql-connector-java:5.1.43:jar -Dtransitive=false  -Ddest=$NIFI_HOME/lib/mysql-connector-java-5.1.41.jar


exec $NIFI_HOME/bin/nifi.sh run
