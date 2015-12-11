FROM ubuntu

ENV VERSION 2.8.0

RUN apt-get update -q
RUN apt-get install -qy curl build-essential libcurl4-openssl-dev

RUN mkdir /src
WORKDIR /src
RUN curl http://staff.washington.edu/fox/webisoget/webisoget-$VERSION.tar.gz \
        | tar -zxf-
RUN ln -s webisoget-$VERSION webisoget
WORKDIR /src/webisoget
RUN ./configure
RUN make
RUN cp webisoget /

# http://docs.docker.com/engine/reference/builder/#entrypoint
ENTRYPOINT ["/webisoget"]
CMD ["--help"]
