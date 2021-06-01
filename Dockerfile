FROM node:14.17.0-alpine as builder
WORKDIR /app
COPY ./package.json ./
RUN yarn install
COPY ./ ./
RUN yarn build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html