# aws-ecs-nodejs


1. Inserte las siguientes líneas en el archivo Docker antes del ENTRYPOINT o del último comando CMD.

        FROM <base-image> # Esta es la *última* cláusula FROM en su Dockerfile
        
        COPY --from=icr.io/instana/aws-fargate-nodejs:latest /instana /instana
        RUN /instana/setup.sh
        ENV NODE_OPTIONS="--require /instana/node_modules/@instana/aws-fargate"
        
        # Otras cosas en su imagen Docker

2. Establecer las siguientes variables de entorno en la definición de tareas ECS.

        INSTANA_ENDPOINT_URL: https://serverless-orange-saas.instana.io
        
        INSTANA_AGENT_KEY: {AgentKey}

    ![image](https://github.com/juan-conde-21/aws-ecs-nodejs/assets/13276404/cbd29e16-d593-4e2b-afc3-67103d4703e2)

3. Revisar en consola Instana



