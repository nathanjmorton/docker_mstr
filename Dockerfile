# download link
# https://mirror.microstrategy.com/software/11.2/GA/MicroStrategy%2011.2%20Secure%20Enterprise/MicroStrategy_11.2_IntelligentEnterprise_Linux_11.2.0000.2270.tar.gz



FROM tomcat:7.0-jdk8-openjdk as tomcat-jdk

FROM ubuntu:18.04 
ENV DEBIAN_FRONTEND noninteractive

# setup jdk - from tomcat7 openjdk8 
COPY --from=tomcat-jdk /usr/local/openjdk-8 /opt/openjdk-8
ENV JAVA_HOME /opt/openjdk-8

# setup from tomcat9 (hopefully the variables work on tomcat7 because these weren't specified)
COPY --from=tomcat-jdk /usr /usr
# redundant yet instructive
COPY --from=tomcat-jdk /usr/local/tomcat /opt/tomcat 
ENV CATALINA_BASE /opt/tomcat
ENV CATALINA_HOME /opt/tomcat
ENV CATALINA_TMPDIR /opt/tomcat/temp
ENV JRE_HOME /usr
ENV CLASSPATH /opt/tomcat/bin/bootstrap.jar:/opt/tomcat/bin/tomcat-juli.jar

# from version 7 (these may be extras )
COPY --from=tomcat-jdk /usr/local/sbin /usr/local/sbin
COPY --from=tomcat-jdk /usr/local/bin /usr/local/bin
COPY --from=tomcat-jdk /usr/sbin /usr/sbin
COPY --from=tomcat-jdk /usr/bin /usr/bin
COPY --from=tomcat-jdk /sbin /sbin
COPY --from=tomcat-jdk /bin /bin 
ENV PATH $CATALINA_HOME/bin:$JAVA_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
ENV TOMCAT_NATIVE_LIBDIR=/usr/local/tomcat/native-jni-lib
ENV LD_LIBRARY_PATH=/usr/local/tomcat/native-jni-lib
ENV JAVA_VERSION=8u252
ENV TOMCAT_MAJOR=7
ENV TOMCAT_VERSION=7.0.104

EXPOSE 8080
EXPOSE 8443

# Configuration: <TomcatPath>/webapps/MicroStrategy/WEBINF/
# classes
# Installation: <InstallPath>/WebUniversal
# Log Location: <TomcatPath>/webapps/MicroStrategy/WEBINF/
# log

# TCP: 30241
# TCP: 34952
# TCP: 34962
# Two-Way SSL: 39320
# Two-Way SSL: 39321
# Linux Information
# Configuration: Metadata object - Registry File
# Log Location: <logpath>/DSSerrors.log

# Default product directory /opt/MicroStrategy/Product Name, or
# $HOME/MicroStrategy/install/Product Name if you do not have
# write access to /opt/MicroStrategy,
# install dir is /tmp


# custom install packages pg 131 of install and config guide
# system settings for Linux pg 127 
# i-server needs 16GB of RAM and 48GB of DISK space
# web server needs 4GB of RAM and 3GB of DISK space
# install dir /tmp needs 100GB of DISK space





# Install required dependencies for Microstrategy 
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    wget \
    pkg-config \
    git \
    cryptsetup

