# inspired by https://github.com/hauptmedia/docker-jmeter  and test
# https://github.com/hhcordero/docker-jmeter-server/blob/master/Dockerfile
FROM openjdk:oracle

MAINTAINER Just van den Broecke<just@justobjects.nl>


#COPY . /app

ARG JMETER_VERSION="5.0"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV	JMETER_DOWNLOAD_URL  http://mirrors.ocf.berkeley.edu/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

# Install extra packages
# See https://github.com/gliderlabs/docker-alpine/issues/136#issuecomment-272703023
# Change TimeZone TODO: TZ still is not set!
ARG TZ="Europe/Amsterdam"
RUN mkdir -p /tmp/dependencies  \
	&& curl -L  ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
	&& mkdir -p /opt  \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
	&& rm -rf /tmp/dependencies

# TODO: plugins (later)
# && unzip -oq "/tmp/dependencies/JMeterPlugins-*.zip" -d $JMETER_HOME

# Set global PATH such that "jmeter" command is found
ENV PATH $PATH:$JMETER_BIN

# Entrypoint has same signature as "jmeter" command
#COPY entrypoint.sh /

# Entrypoint has same signature as "jmeter" command
#COPY entrypoint.sh /
#COPY octopus.jmx /

COPY . /app

WORKDIR	${JMETER_HOME}

ENTRYPOINT ["/app/entrypoint.sh"]
