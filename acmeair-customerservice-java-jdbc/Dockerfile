FROM open-liberty:full

COPY --chown=1001:0 src/main/liberty/config/server.xml /config/server.xml
COPY --chown=1001:0 src/main/liberty/config/server.env /config/server.env
COPY --chown=1001:0 src/main/liberty/config/jvm.options /config/jvm.options

COPY --chown=1001:0 target/acmeair-customerservice-java-3.3.war /config/apps/

COPY --chown=1001:0 drivers/ /drivers/

ARG CREATE_OPENJ9_SCC=true
ENV OPENJ9_SCC=${CREATE_OPENJ9_SCC}

RUN configure.sh

