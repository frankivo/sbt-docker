ARG URL=https://github.com/sbt/sbt/releases/download/v1.6.2/sbt-1.6.2.tgz

FROM openjdk:8-alpine as downloader
ARG URL
RUN apk add --no-cache bash
RUN wget $URL -O /home/sbt.tgz
RUN tar xf /home/sbt.tgz -C /home

FROM openjdk:8-alpine
RUN apk add --no-cache bash
COPY --from=downloader /home/sbt /home/sbt
RUN ln -s /home/sbt/bin/sbt /usr/local/bin/
