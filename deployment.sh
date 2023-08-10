#!/bin/sh

# Author : Rohit Jadhav

AWS_ACCOUNT_ID=""
AWS_REGION=""
AWS_ECR_REPO=""
AWS_TASK_DEFINATION=""
AWS_ECS_CLUSTER=""
AWS_SUBNET_A_ID=""
AWS_SUBNET_B_ID=""
AWS_SECURITY_GROUP_ID=""

echo "========== creating docker image"

docker build -t nodeserver .

echo "========== tagging docker image with ECR tag"

docker tag nodeserver $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$AWS_ECR_REPO:latest

echo "========== List all docker images"

docker images

echo "========== Push tagged image to ECR"

docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$AWS_ECR_REPO:latest

echo "========== RUN ECS container"

aws ecs run-task --cluster $AWS_ECS_CLUSTER --task-definition $AWS_TASK_DEFINATION --network-configuration "awsvpcConfiguration={subnets=[$AWS_SUBNET_A_ID,$AWS_SUBNET_B_ID],securityGroups=[$AWS_SECURITY_GROUP_ID]}" --launch-type FARGATE > run.log

echo "================= DEPLOYMENT FINISHED ================="