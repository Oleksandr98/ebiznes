FROM ubuntu:18.04

RUN apt update
RUN apt install -y openjdk-8-jdk
RUN apt install -y openjdk-8-jre

RUN apt install -y npm

RUN apt install -y curl
RUN curl -L -o scala-2.12.13.deb www.scala-lang.org/files/archive/scala-2.12.8.deb
RUN dpkg -i scala-2.12.13.deb
RUN rm scala-2.12.13.deb

RUN curl -L -o sbt-1.4.8.deb http://dl.bintray.com/sbt/debian/sbt-1.4.9.deb
RUN dpkg -i sbt-1.4.8.deb
RUN rm sbt-1.4.8.deb

RUN useradd -ms /bin/bash oleksandr
USER oleksandr
WORKDIR /home/oleksandr
RUN mkdir /home/oleksandr/dataExchange

EXPOSE 8081
EXPOSE 8082

VOLUME ["/home/oleksandr/dataExchange"]