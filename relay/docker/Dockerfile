# Offset relay dockerfile
# Requires /ident/relay.ident for operation.

FROM ubuntu:bionic
MAINTAINER real <real@freedomlayer.org>

RUN apt-get update && \
        apt-get install -y curl && \
        apt-get clean

# Listening port:
ENV LPORT "8080"
# Show full backtraces in case 
ENV RUST_BACKTRACE "full"
# Show warning logs
ENV RUST_LOG "warn"
# Version of OFFSET to use:
ENV OFFSET_VERSION "v0.1.0-alpha.4"


# Download an offset release and extract strelay:
RUN OFFSET_NAME="offset-${OFFSET_VERSION}-x86_64-unknown-linux-gnu" && \
        curl -o offset.tar.gz -L https://github.com/freedomlayer/offset/releases/download/${OFFSET_VERSION}/${OFFSET_NAME}.tar.gz && \
        tar xvzf offset.tar.gz && \
        mkdir /app && \
        cp ${OFFSET_NAME}/bin/strelay /app/strelay && \
        rm -rf offset.tar.gz && \
        rm -rf ${OFFSET_NAME}


EXPOSE ${LPORT}


# Start the relay:
CMD /app/strelay --idfile /ident/relay.ident --laddr 0.0.0.0:${LPORT}

