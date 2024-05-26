# Build stage
FROM node:20.12.2-alpine AS build

WORKDIR /client

COPY package*.json ./

RUN npm install -g npm@latest

RUN npm install

COPY . .

RUN npm run build

# Production stage
FROM node:20.12.2-alpine AS production

WORKDIR /app

COPY --from=build /client/build /app/build
COPY --from=build /client/node_modules /app/node_modules
COPY --from=build /client/package.json /app/package.json
COPY --from=build /client/public /app/public
COPY --from=build /client/src /app/src

ENV NODE_ENV=production

EXPOSE 3000

CMD ["npm", "start"]
