# gh-action-ecs-deploy

This action deploys ECS services using [fabfuel/ecs-deploy](https://github.com/fabfuel/ecs-deploy) tool.

## Example usage

```yml
- name: Checkout AWS ECS Deploy GH Action
    uses: actions/checkout@v2
    with:
      repository: robertomoutinho/gh-action-ecs-deploy
      token: ${{ github.token }}
      path: ./.github/actions/ecs-deploy

- name: Deploy App to ECS Service
    uses: ./.github/actions/ecs-deploy
    with:
      app_repo_url: ${{ env.ecr_repository }}
      app_version: ${{ env.GITHUB_SHA_SHORT }}
      ecs_cluster: 'production'
      ecs_service: 'web-app'
      ecs_container_name: 'web'
      aws_region: 'us-east-1'
      aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
      aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

Check the [fabfuel/ecs-deploy](https://github.com/fabfuel/ecs-deploy) for more information about what you can do with it.