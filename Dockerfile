FROM node:18-alpine

COPY --from=icr.io/instana/aws-fargate-nodejs:latest /instana /instana
RUN /instana/setup.sh
ENV NODE_OPTIONS="--require /instana/node_modules/@instana/aws-fargate"

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

#USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "app.js" ]
