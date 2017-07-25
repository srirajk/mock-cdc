FROM anapsix/alpine-java:8_jdk

ARG kafka_dist=kafka_2.12-0.10.2.1.tgz

ENV KAFKA_HOME=/kafka/kafka_2.12-0.10.2.1
ENV logDir=$KAFKA_HOME/log
#ENV dataDir=$KAFKA_HOME/data

ADD $kafka_dist /kafka


RUN mkdir -p $logDir && \
  #  mkdir -p $dataDir && \
    addgroup -S kafka && \
    adduser -D -S -H -G kafka -h $KAFKA_HOME kafka && \
    chown -R kafka:kafka /kafka $logDir

COPY entrypoint.sh /

RUN chown kafka:kafka /entrypoint.sh && \
    chmod u+x /entrypoint.sh

USER kafka

EXPOSE 9092

VOLUME ["$logDir"]

ENTRYPOINT ["/entrypoint.sh"]
