FROM centos:7

# Prepare image
ARG JAVA_VERSION=1.8.0

RUN yum install -y wget java-$JAVA_VERSION-openjdk-devel \
    && yum groupinstall -y "Development Tools" \
    && yum clean all

# Install application
ARG GRIDDB_VERSION
ARG GRIDDB_PACKAGE=https://github.com/griddb/griddb/releases/download/v${GRIDDB_VERSION}/griddb-${GRIDDB_VERSION}-1.linux.x86_64.rpm

RUN wget -q -O griddb.rpm ${GRIDDB_PACKAGE} \
    && rpm -ivh griddb.rpm \
    && rm griddb.rpm


RUN su - gsadm -c "gs_passwd admin -p admin" \
    && sed -i -e s/\"clusterName\":\"\"/\"clusterName\":\"development\"/g \
       /var/lib/gridstore/conf/gs_cluster.json

# Setup user
ENV GS_HOME /var/lib/gridstore
ENV GS_LOG ${GS_HOME}/log
WORKDIR $GS_HOME

USER gsadm
