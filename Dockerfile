FROM centos:7

# Install application
ARG GRIDDB_VERSION
ARG GRIDDB_PACKAGE=https://github.com/griddb/griddb/releases/download/v${GRIDDB_VERSION}/griddb-${GRIDDB_VERSION}-1.linux.x86_64.rpm

RUN rpm -Uv ${GRIDDB_PACKAGE}
RUN su - gsadm -c "gs_passwd admin -p admin" \
    && sed -i -e s/\"clusterName\":\"\"/\"clusterName\":\"development\"/g \
       /var/lib/gridstore/conf/gs_cluster.json

# Setup network
EXPOSE 10001 10010 10020 10040

# Setup user
ENV GS_HOME /var/lib/gridstore
ENV GS_LOG ${GS_HOME}/log
WORKDIR $GS_HOME

USER gsadm
