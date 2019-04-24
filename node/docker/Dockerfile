# Offst node dockerfile
# Requires volumes: 
# - /ident/node.ident
# - /trusted

FROM ubuntu:bionic
MAINTAINER real <real@freedomlayer.org>

RUN apt-get update && \
        apt-get install -y curl && \
        apt-get clean

# Listening port for apps
ENV LPORT "4040"
# Show full backtraces in case 
ENV RUST_BACKTRACE "full"
# Show warning logs
ENV RUST_LOG "warn"
# Version of OFFST to use:
ENV OFFST_VERSION "v0.1.0-alpha.0"


# Download an offst release and extract stnode:
RUN OFFST_NAME="offst-${OFFST_VERSION}-x86_64-unknown-linux-gnu" && \
        curl -o offst.tar.gz -L https://github.com/freedomlayer/offst/releases/download/${OFFST_VERSION}/${OFFST_NAME}.tar.gz && \
        tar xvzf offst.tar.gz && \
        mkdir /app && \
        cp ${OFFST_NAME}/bin/stnode /app/stnode && \
        rm -rf offst.tar.gz && \
        rm -rf ${OFFST_NAME}


EXPOSE ${LPORT}

# Start the node:
CMD /app/stnode --idfile /ident/node.ident --database /db/node.db --trusted /trusted --laddr 0.0.0.0:${LPORT}

