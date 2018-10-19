#!/bin/bash
export ELK_VERSION=6.4.0
export ELASTICSEARCH_HOST=elasticsearch
export KIBANA_HOST=kibana
export ELASTIC_VERSION=6.3.2

docker network create --driver overlay elastic
# docker stack deploy -c docker-compose.yml elastic
env $(cat .env.develop | xargs) docker stack deploy -c filebeat-docker-compose.yml filebeat
env $(cat .env.develop | xargs) docker stack deploy -c metricbeat-docker-compose.yml metricbeat
env $(cat .env.develop | xargs) docker stack deploy -c packetbeat-docker-compose.yml packetbeat
