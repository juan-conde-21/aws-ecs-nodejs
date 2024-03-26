# aws-ecs-nodejs


1. Inserte las siguientes líneas en el archivo Docker antes del ENTRYPOINT o del último comando CMD.

        FROM <base-image> # Esta es la *última* cláusula FROM en su Dockerfile
        
        COPY --from=icr.io/instana/aws-fargate-nodejs:latest /instana /instana
        RUN /instana/setup.sh
        ENV NODE_OPTIONS="--require /instana/node_modules/@instana/aws-fargate"
        
        # Otras cosas en su imagen Docker

2. Construir la imagen que sera desplegada en el servicio Fargate ECS.

3. En el servicio Fargate ECS referenciar a la imagen creada en el punto anterior.

4. Establecer las siguientes variables de entorno en la definición de tareas ECS.

        INSTANA_ENDPOINT_URL: https://serverless-orange-saas.instana.io
        
        INSTANA_AGENT_KEY: {AgentKey}

        INSTANA_SERVICE_NAME: {Nombre_personalizado_de_servicio_en_Instana}

    ![image](https://github.com/juan-conde-21/aws-ecs-nodejs/assets/13276404/7c405a80-bf0e-4229-a1b9-f732647dd7e4)


5. Revisar en consola Instana, para este ejemplo el nombre del servicio es nodejs.

        ![image](https://github.com/juan-conde-21/aws-ecs-nodejs/assets/13276404/b018601e-709f-4b44-a0d6-bd365fb3a351)



