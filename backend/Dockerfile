FROM alpine:3.19

RUN apk add --no-cache nodejs npm

WORKDIR /backend

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5000

CMD ["npm", "start"]