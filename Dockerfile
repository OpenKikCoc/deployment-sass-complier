FROM alpine

RUN apk add --no-cache \
        libstdc++ && \
    apk add --no-cache --virtual \
        build-dependencies build-base git && \
    git clone \
        https://github.com/sass/sassc.git && \
    . sassc/script/bootstrap && \
    make -C sassc -j4 && \
    mv \
        ./sassc/bin/sassc /usr/sbin/sassc && \
    rm -rf \
        sass* \
        libsass && \
    apk del \
        git build-dependencies

WORKDIR /work