FROM alpine:3.19 AS production

LABEL maintainer="chales ondabu <info@condabu.com>"
LABEL description="This is a docker image for yolo backend application"
LABEL category="Web Application"

RUN apk add --no-cache nodejs npm
WORKDIR /backend

COPY package*.json ./

RUN npm install --production

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
