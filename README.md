# gh-action-ecs-deploy

This action deploys ECS services using [fabfuel/ecs-deploy](https://github.com/fabfuel/ecs-deploy) tool.

## Example usage

```yml
- name: Checkout ECS Deploy Private GH Action
    uses: actions/checkout@v2
    with:
      repository: robertomoutinho/gh-action-ecs-deploy
      token: ${{ secrets.ACTIONS_TOKEN }}
      path: ./.github/actions/ecs-deploy

- name: Set git short SHA commit to outputs
    id: extract_short_sha
    run: echo "::set-output name=sha_short::$(git rev-parse --short HEAD)"

- name: Deploy App to ECS Service
    uses: ./.github/actions/ecs-deploy
    with:
      app_repo_url: ${{ env.ecr_repository }}
      app_version: ${{ steps.vars.outputs.sha_short }}
      ecs_cluster: 'production'
      ecs_service: 'web'
      ecs_container_name: 'web'
      aws_region: 'us-east-1'
      aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
      aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

Check the [fabfuel/ecs-deploy](https://github.com/fabfuel/ecs-deploy) for more information about what you can do with it.