FROM ubuntu:18.04

LABEL maintainer="Shinya Suzuki"
LABEL description="Container for SibeliaZ"

ENV VERSION 1.2.0
ENV TOOLDIR /opt

RUN apt-get update && \
    apt-get install -y --no-install-recommends git \
                                               ca-certificates \
                                               make \
                                               cmake \
                                               build-essential \
                                               libtbb2 \
                                               libtbb-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR ${TOOLDIR}
RUN git clone https://github.com/medvedevgroup/SibeliaZ.git -b v${VERSION} --depth 1 && \
    cd SibeliaZ && \
    mkdir build && \
    git submodule update --init --recursive && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make install && \
    cd ${TOOLDIR} && \
    rm -rf SibeliaZ

CMD ["sibeliaz", "-h"]
