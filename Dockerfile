FROM ubuntu:xenial

MAINTAINER John <yinzhuan@cisco.com>

Add . /root/

WORKDIR /root/

RUN echo "install third party from local "
RUN apt-get update && apt-get install -y wget
RUN wget "https://bitbucket.org/john_zhuang_team/jdk_on_linux/raw/e2fd6ec565e93cc24ba30311ccfadcf53854fbb1/jdk-8u91-linux-x64.tar.gz" \
    -O /root/jdk-8u91-linux-x64.tar.gz
    
RUN tar xvf jdk-8u91-linux-x64.tar.gz  -C /opt  \
    && ln -s /opt/jdk1.8.0_91/bin/java /usr/bin/java \
    && ln -s /opt/jdk1.8.0_91/bin/javac /usr/bin/javac \
    && rm jdk-8u91-linux-x64.tar.gz \
    && rm /opt/jdk1.8.0_91/src.zip /opt/jdk1.8.0_91/javafx-src.zip


ENV JAVA_HOME /opt/jdk1.8.0_91/
RUN java -version