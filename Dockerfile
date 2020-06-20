FROM node:12-alpine

RUN mkdir -p /app

WORKDIR /app

COPY package*.json ./

RUN npm install
RUN npm run build

EXPOSE 3000

CMD [ "npm", "run", "start:prod" ]
