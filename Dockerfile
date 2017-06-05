FROM alpine:3.6
LABEL Name=delr3ves/sphinxsearch Version=latest

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ sphinx

ENV SPHINX_CONFIG "/etc/sphinx/sphinx.conf"

CMD indexer --config $SPHINX_CONFIG  --all && searchd --config $SPHINX_CONFIG --nodetach "$@"

