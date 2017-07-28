# README #


Replication of data between mysql and cassandra/hive using nifi.

![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/0aab5a05bef639e0f94258deefec4b932074f9e3/Nifi-flow.png)



### Setup ###

Make sure to install docker and docker-compose or use http://labs.play-with-docker.com/

clone the repo.

git clone https://sriraj10@bitbucket.org/skadimisetty/mock-cdc.git

sh startScript.sh

the above command will setup the environment.

upload the templates from mock-cdc/nifi/nifi-templates to nifi. 
start the flow.

sh curlCommands.sh 
the above command will trigger and load data into mysql for 10 sec and then stop the process as this is only for a test.

if you refresh your screen on nifi, you should be able to see data flowing through.

Note: I am in the process of automating the template upload to nifi.


