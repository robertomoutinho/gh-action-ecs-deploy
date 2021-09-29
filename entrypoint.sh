#!/bin/sh -le

echo "Deploying $INPUT_ECS_SERVICE to Cluster $INPUT_ECS_CLUSTER with version: $INPUT_APP_VERSION"

result=$(ecs deploy $INPUT_ECS_CLUSTER $INPUT_ECS_SERVICE \
                --no-deregister \
                --region $INPUT_AWS_REGION \
                --image $INPUT_ECS_CONTAINER_NAME $INPUT_APP_REPO_URL:$INPUT_APP_VERSION \
                --access-key-id $INPUT_AWS_ACCESS_KEY_ID \
                --secret-access-key $INPUT_AWS_SECRET_ACCESS_KEY )

echo "::set-output name=result::$result"