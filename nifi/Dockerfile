# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
#

FROM openjdk:8
#FROM maven:3.5-jdk-8-alpine


ARG UID=1000
ARG GID=50
ARG NIFI_VERSION=1.3.0

ARG MAVEN_VERSION=3.5.0
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries
ARG MAVEN_BASE_DIR=/opt/maven

ENV NIFI_BASE_DIR /opt/nifi
ENV NIFI_HOME $NIFI_BASE_DIR/nifi-$NIFI_VERSION
ENV NIFI_BINARY_URL https://archive.apache.org/dist/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz

# Setup NiFi user
RUN groupadd -g $GID nifi || groupmod -n nifi `getent group $GID | cut -d: -f1`
RUN useradd --shell /bin/bash -u $UID -g $GID -m nifi
RUN mkdir -p $NIFI_HOME

RUN mkdir -p $MAVEN_BASE_DIR \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && tar -xzf /tmp/apache-maven.tar.gz -C $MAVEN_BASE_DIR --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz
# && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn



ENV M2_HOME $MAVEN_BASE_DIR
ENV M2 $M2_HOME/bin
ENV PATH $M2:$PATH


# Download, validate, and expand Apache NiFi binary.
RUN curl -fSL $NIFI_BINARY_URL -o $NIFI_BASE_DIR/nifi-$NIFI_VERSION-bin.tar.gz \
	&& echo "$(curl $NIFI_BINARY_URL.sha256) *$NIFI_BASE_DIR/nifi-$NIFI_VERSION-bin.tar.gz" | sha256sum -c - \
	&& tar -xvzf $NIFI_BASE_DIR/nifi-$NIFI_VERSION-bin.tar.gz -C $NIFI_BASE_DIR \
	&& rm $NIFI_BASE_DIR/nifi-$NIFI_VERSION-bin.tar.gz

#ADD jars/ $NIFI_HOME/lib

COPY Entrypoint.sh /

RUN chown nifi:nifi /Entrypoint.sh && \
    chmod u+x /Entrypoint.sh

RUN chown -R nifi:nifi $NIFI_HOME

# Web HTTP Port
EXPOSE 8080

# Remote Site-To-Site Port
EXPOSE 8181

USER nifi

# Startup NiFi

ENTRYPOINT ["/Entrypoint.sh"]

#CMD $NIFI_HOME/bin/nifi.sh run
