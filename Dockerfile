## Build API

FROM node:12 as api-builder
WORKDIR /usr/api
COPY Blog-api/package*.json ./
COPY Blog-api/tsconfig.json ./
RUN npm install
COPY Blog-api/ ./
RUN npm run build


## Build Vue App
FROM node:12 as app-builder
WORKDIR /usr/app
COPY blog-app/package*.json ./
COPY blog-app/tsconfig.json ./
RUN npm install
COPY blog-app/ ./
RUN npm run build


## Run Complete App
FROM node:12
WORKDIR /usr/blog
COPY Blog-api/package*.json ./
RUN npm install --only=production
COPY --from=api-builder /usr/api/dist .
WORKDIR /usr/blog/app
COPY blog-app/package*.json ./
RUN npm install --only=production
COPY --from=app-builder /usr/app/dist .
EXPOSE 3001
CMD [ "node" , "/usr/blog/server.js" ]
