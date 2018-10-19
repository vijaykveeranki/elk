FROM docker.elastic.co/beats/filebeat:${ELASTIC_VERSION:-6.3.2}
COPY ./elk/beats/filebeat/config/filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
USER filebeat
