FROM alpine:3.19

RUN apk add --no-cache nodejs npm

WORKDIR /client

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]