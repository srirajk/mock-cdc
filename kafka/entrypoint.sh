#!/bin/bash




config=$KAFKA_HOME/config/server.properties
#ip=$(hostname -i)

ip=$(hostname)

if [ -z "$brokerId" ]; then
  export brokerId=$(hostname)
fi

parsedBrokerId=${brokerId//[^0-9]/}

#advertised.listeners=PLAINTEXT://your.host.name:9092

sed -i -e "s|log.dirs=/tmp/kafka-logs|log.dirs=$KAFKA_HOME/log|" $config
#sed -i -e "s|broker.id=0|broker.id=$parsedBrokerId|" $config
sed -i "s|^\(broker\.id\s*=\s*\).*\$|#broker\.id=|" $config
sed -i -e "s|#listeners=PLAINTEXT://:9092|listeners=PLAINTEXT://$ip:9092|" $config
#sed -i -e "s|#advertised.listeners=PLAINTEXT://your.host.name:9092|advertised.listeners=PLAINTEXT://$ip:9092|" $config
sed -i "s|^\(#advertised\.listeners\s*=\).*\$|advertised\.listeners=PLAINTEXT://$ip:9092|" $config
sed -i -e "s|zookeeper.connect=localhost:2181|zookeeper.connect=$zkQuorum|" $config


echo "properties changed."

exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
