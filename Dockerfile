FROM node:14.17.0-alpine
WORKDIR /app
COPY ./package.json ./
RUN yarn install
COPY ./ ./
RUN yarn build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html