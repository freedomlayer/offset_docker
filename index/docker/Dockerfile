# Offset index dockerfile
# Requires volumes: 
# - /ident/index.ident
# - /trusted

FROM ubuntu:bionic
MAINTAINER real <real@freedomlayer.org>

RUN apt-get update && \
        apt-get install -y curl && \
        apt-get clean

# Load version:
ADD VERSION.tmp /info/VERSION

# Listening port for clients (nodes):
ENV CLIENT_LPORT "5050"
# Listening port for index servers:
ENV SERVER_LPORT "5051"
# Show full backtraces in case 
ENV RUST_BACKTRACE "full"
# Show warning logs
ENV RUST_LOG "warn"

# Download an offset release and extract stindex:
RUN export OFFSET_VERSION="v$(cat /info/VERSION | tr -d '\n')" && \
        OFFSET_NAME="offset-${OFFSET_VERSION}-x86_64-unknown-linux-gnu" && \
        curl -o offset.tar.gz -L https://github.com/freedomlayer/offset/releases/download/${OFFSET_VERSION}/${OFFSET_NAME}.tar.gz && \
        tar xvzf offset.tar.gz && \
        mkdir /app && \
        cp ${OFFSET_NAME}/bin/stindex /app/stindex && \
        rm -rf offset.tar.gz && \
        rm -rf ${OFFSET_NAME}


EXPOSE ${CLIENT_LPORT}
EXPOSE ${SERVER_LPORT}

# Start the index:
CMD /app/stindex --idfile /ident/index.ident --lclient 0.0.0.0:${CLIENT_LPORT} --lserver 0.0.0.0:${SERVER_LPORT} --trusted /trusted

