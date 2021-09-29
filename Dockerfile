FROM fabfuel/ecs-deploy:1.11.0

LABEL author="Roberto Moutinho <@robertomoutinho>"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]