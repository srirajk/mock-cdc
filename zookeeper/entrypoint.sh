#!/bin/sh

cp $ZK_HOME/conf/zoo_sample.cfg $ZK_HOME/conf/zoo.cfg

tickTime=${tickTime:=2000}
clientport=${clientPort:=2181}
#logDir=$ZK_HOME/log
#dataDir=$ZK_HOME/data



#chown -R zk:zk $logDir $dataDir


sed -i -e "s|dataDir=/tmp/zookeeper|dataDir=$dataDir|" $ZK_HOME/conf/zoo.cfg
sed -i -e "s|tickTime=2000|tickTime=$tickTime|" $ZK_HOME/conf/zoo.cfg
sed -i -e "s|clientPort=2181|clientPort=$clientPort|" $ZK_HOME/conf/zoo.cfg
sed -i -e "s|zookeeper.log.dir=.|zookeeper.log.dir=$logDir|" $ZK_HOME/conf/log4j.properties

echo "properties changed."

echo "servers :: $SERVERS"



addServers() {
  serverCount=1
  for server in $SERVERS; do
    echo "server.${serverCount}=${server}" >> $ZK_HOME/conf/zoo.cfg
    serverCount=$((serverCount + 1))
  done
}

if [ -n "$SERVERS" ]; then
  echo "inside servers"
  addServers
fi

exec $ZK_HOME/bin/zkServer.sh start-foreground
