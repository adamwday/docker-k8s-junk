#!/bin/bash

#REPO_NAME=$elasticsearch
#
#if [ $# -ne elasticsearch]; then
#   echo $0: usage: $0 REPO_NAME
#   exit 1
#fi

#Runs the docker login command
aws ecr get-login --no-include-email --region us-east-1

#Builds the docker image
docker built --tag  elasticsearch .

#Tags the docker image before we push it to the ECR.
docker tag elasticsearch:latest ${AWSAccountId}.dkr.ecr.us-east-1.amazonaws.com/elasticsearch:latest

#Pushes the docker image to AWS ECR
docker push ${AWSAccountId}.dkr.ecr.us-east-1.amazonaws.com/elasticsearch:latest
  
