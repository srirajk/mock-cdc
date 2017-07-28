# README #


Replication of data between mysql and cassandra/hive using nifi.

![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/0aab5a05bef639e0f94258deefec4b932074f9e3/Nifi-flow.png)



### Setup ###

Make sure to install docker and docker-compose or use http://labs.play-with-docker.com/.
 Note: make sure the memory is high on docker machine.

clone the repo.

git clone https://sriraj10@bitbucket.org/skadimisetty/mock-cdc.git

sh startScript.sh
  the above command will setup the environment.

sh curlCommands.sh 
  the above command will trigger and load data into mysql for 10 sec and then stop the process as this is only for a test.
  it also imports templates into nifi.

validate you are able to see 2 templates on nifi.

![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/82d8ea9c728a8ac5473ff2f9ab45e0c501ec7755/Screen%20Shot%202017-07-28%20at%202.25.32%20PM.png)

screens to follow on nifi inorder to configure the flow the nifi canvas.

step 1: add templates to the canvas.
  ![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/82d8ea9c728a8ac5473ff2f9ab45e0c501ec7755/Screen%20Shot%202017-07-28%20at%202.27.37%20PM.png)
  ![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/82d8ea9c728a8ac5473ff2f9ab45e0c501ec7755/Screen%20Shot%202017-07-28%20at%202.27.46%20PM.png)
  Repeat the procedure for the other template as well.
  
step 2: configure password for the db controller service.
  ![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/82d8ea9c728a8ac5473ff2f9ab45e0c501ec7755/Screen%20Shot%202017-07-28%20at%202.30.04%20PM.png)
  click on the properties tab.
  ![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/82d8ea9c728a8ac5473ff2f9ab45e0c501ec7755/Screen%20Shot%202017-07-28%20at%202.30.09%20PM.png)
  click on the arrow which will redirect you to the db connection settings screen.
  ![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/82d8ea9c728a8ac5473ff2f9ab45e0c501ec7755/Screen%20Shot%202017-07-28%20at%202.30.14%20PM.png)
  click on the edit as pointed on the screen.
  ![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/82d8ea9c728a8ac5473ff2f9ab45e0c501ec7755/Screen%20Shot%202017-07-28%20at%202.30.29%20PM.png)
  follow the screen and add the env variable for the db password.
  ![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/0e8e9ed82af1fcc57ba32a534b236b6299b880dd/Screen%20Shot%202017-07-28%20at%202.57.51%20PM.png)

step 3: once all teh configuration is done, please select both the templates and start the process.
step 4: if everything is configured right, you should be able to see the data flowing. please refresh the screen.

  ![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/0e8e9ed82af1fcc57ba32a534b236b6299b880dd/Screen%20Shot%202017-07-28%20at%202.34.36%20PM.png)
  ![alt text](https://bytebucket.org/skadimisetty/mock-cdc/raw/0e8e9ed82af1fcc57ba32a534b236b6299b880dd/Screen%20Shot%202017-07-28%20at%202.44.27%20PM.png)

Note: automated the process to import templates into nifi but still need to work on building a script to go ahead and instantiate the template along with configuring the controller services and controllers.


