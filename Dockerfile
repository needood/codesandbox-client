FROM nginx:1.16.1-alpine

COPY www /var/www/codesandbox

FROM node:10.14.2 as build

WORKDIR /

ADD . .

RUN /bin/sh build.sh

FROM nginx:1.16.1-alpine

COPY --from=build /packages/app/www /usr/share/nginx/html/
