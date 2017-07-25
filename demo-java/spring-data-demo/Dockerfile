FROM maven:3.5-jdk-8-alpine

ADD src /demo/src
ADD pom.xml /demo

EXPOSE 8080

#VOLUME /tmp

WORKDIR /demo

RUN mvn clean install

ENTRYPOINT ["java","-jar","target/spring-data-demo-0.0.1-SNAPSHOT.jar"]
