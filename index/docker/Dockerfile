# Offst index dockerfile
# Requires volumes: 
# - /ident/index.ident
# - /trusted

FROM ubuntu:bionic
MAINTAINER real <real@freedomlayer.org>

RUN apt-get update && \
        apt-get install -y curl && \
        apt-get clean

# Listening port for clients (nodes):
ENV CLIENT_LPORT "5050"
# Listening port for index servers:
ENV SERVER_LPORT "5051"
# Show full backtraces in case 
ENV RUST_BACKTRACE "full"
# Show warning logs
ENV RUST_LOG "warn"
# Version of OFFST to use:
ENV OFFST_VERSION "v0.1.0-alpha.0"


# Download an offst release and extract stindex:
RUN OFFST_NAME="offst-${OFFST_VERSION}-x86_64-unknown-linux-gnu" && \
        curl -o offst.tar.gz -L https://github.com/freedomlayer/offst/releases/download/${OFFST_VERSION}/${OFFST_NAME}.tar.gz && \
        tar xvzf offst.tar.gz && \
        mkdir /app && \
        cp ${OFFST_NAME}/bin/stindex /app/stindex && \
        rm -rf offst.tar.gz && \
        rm -rf ${OFFST_NAME}


EXPOSE ${CLIENT_LPORT}
EXPOSE ${SERVER_LPORT}

# Start the index:
CMD /app/stindex --idfile /ident/index.ident --lclient 0.0.0.0:${CLIENT_LPORT} --lserver 0.0.0.0:${SERVER_LPORT} --trusted /trusted

