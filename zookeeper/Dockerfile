FROM anapsix/alpine-java:8_jdk

ARG zookeeper_dist=zookeeper-3.4.10.tar.gz

ENV ZK_HOME=/zookeeper/zookeeper-3.4.10
ENV logDir=$ZK_HOME/log
ENV dataDir=$ZK_HOME/data

ADD $zookeeper_dist /zookeeper


RUN mkdir -p $logDir && \
    mkdir -p $dataDir && \
    addgroup -S zk && \
    adduser -D -S -H -G zk -h /zookeeper zk && \
    chown -R zk:zk /zookeeper $logDir $dataDir

COPY entrypoint.sh /

RUN chown zk:zk /entrypoint.sh && \
    chmod u+x /entrypoint.sh

USER zk

EXPOSE 2181 2888 3888

ENTRYPOINT ["/entrypoint.sh"]

VOLUME ["/zookeeper/zookeeper-3.4.10/log","/zookeeper/zookeeper-3.4.10/data"]
