#!/bin/bash

mkdir -p ~/.ssh
mkdir -p ~/.aws
mkdir -p ~/.project-template/.claude
[ ! -f ~/.project-template/.claude.json ] && echo '{}' > ~/.project-template/.claude.json
mkdir -p ~/.project-template/.kube
mkdir -p ~/.project-template/.config/helm

DOCKER_NETWORK=br-project-template-${USER}
NETWORK_EXISTS=$(docker network ls --filter name=$DOCKER_NETWORK --format '{{.Name}}')

if [ -z "$NETWORK_EXISTS" ]; then
  docker network create $DOCKER_NETWORK
fi