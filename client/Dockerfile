FROM alpine:3.19 AS build

RUN apk add --no-cache nodejs npm

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM alpine:3.19 AS production

RUN apk add --no-cache nodejs npm

WORKDIR /apps

COPY --from=build /app/build /app/build

RUN npm install -g serve

ENV NODE_ENV=production

EXPOSE 3000

WORKDIR /app/build

CMD ["serve", "-s", "."]