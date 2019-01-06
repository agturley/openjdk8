FROM docker.io/agturley/rhel7:latest 
#LABEL maintainer="Apache JDK <dev@JDK.apache.org>"
#LABEL site="https://JDK.apache.org"

ARG JDK_VERSION=1.8.0
ARG BASE_URL=http://docker01.turleyhome.local:8181/dist
ARG MIRROR_BASE_URL=${MIRROR_BASE_URL:-${BASE_URL}}
ARG JDK_BINARY_PATH=${JDK_BINARY_PATH:-/jdk/${JDK_VERSION}/jdk-${JDK_VERSION}-linux-x64.rpm}


# Download, validate, and expand JRE binary.
RUN yum install -y java-${JDK_VERSION}-openjdk \
&& yum clean all \
&&  ln -svT "/usr/lib/jvm/$(rpm -qa |grep -i java-${JDK_VERSION}-openjdk-${JDK_VERSION})/jre" /docker-java-home

ENV JAVA_HOME=/docker-java-home



