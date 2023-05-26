# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
ADD run_nginx.sh /run_nginx.sh
RUN chmod +x /run_nginx.sh

EXPOSE 80
EXPOSE 443

CMD ["/run_nginx.sh"]