FROM nginx:stable-alpine as production-stage
ADD dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
ADD run_nginx.sh /run_nginx.sh
RUN chmod +x /run_nginx.sh

EXPOSE 80
EXPOSE 443

CMD ["/run_nginx.sh"]