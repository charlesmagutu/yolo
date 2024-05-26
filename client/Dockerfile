# Build stage
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production stage
FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/build /app/build
COPY --from=build /app/node_modules /app/node_modules
ENV NODE_ENV=production
EXPOSE 3000
CMD ["npm", "start"]