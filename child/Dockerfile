# inspired by https://github.com/hauptmedia/docker-jmeter  and
# https://github.com/hhcordero/docker-jmeter-server/blob/master/Dockerfile
FROM hammadayaz/swy-jmeter

MAINTAINER Hammad<hammadayaz@gmail.com>

USER root

COPY . /app

WORKDIR	${JMETER_HOME}

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["/bin/bash"]
