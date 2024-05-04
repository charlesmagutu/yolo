FROM alpine:3.19 AS production

RUN apk add --no-cache nodejs npm
WORKDIR /backend

COPY package*.json ./

RUN npm install --production

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
