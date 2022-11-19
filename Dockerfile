FROM node:14-alpine AS builder

RUN mkdir /node-web-app

WORKDIR /node-web-app

COPY . /node-web-app

RUN npm install

RUN npm run-script build

FROM httpd

COPY --from=builder /node-web-app/build /usr/local/apache2/htdocs/

