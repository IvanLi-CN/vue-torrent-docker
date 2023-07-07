FROM node:18 AS build
WORKDIR /app
COPY ./vue-torrent/package*.json ./
RUN npm ci
COPY ./vue-torrent .
RUN npm run build

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/vuetorrent/public .
EXPOSE 3000

CMD serve -s vuetorrent/public