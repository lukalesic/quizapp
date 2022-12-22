FROM nginx:alpine

WORKDIR /etc/nginx/conf.d
COPY nginx.conf default.conf

ENV BUILD_PATH "/web-build/web"

WORKDIR ${BUILD_PATH}
COPY ${BUILD_PATH} .

CMD /docker-entrypoint.sh nginx -g 'daemon off;'