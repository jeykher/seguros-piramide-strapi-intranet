FROM node:current-buster as builder

# Installing app
COPY ./package.json ./

COPY ./package-lock.json ./

RUN npm install

FROM node:current-buster-slim as app

RUN  apt-get update && apt-get install -y nginx

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /app

COPY --from=builder node_modules /app/node_modules

COPY . .

ENV NODE_ENV production

ENV URL_API http://intranet-piramide.com

ENV PREFIX /strapi

ENV ADMIN_JWT_SECRET 673c510a4d79129984e6dd4721707f21

ENV GENERATE_SOURCEMAP=false

ENV NODE_OPTIONS=openssl-legacy-provider

# RUN npm run build

EXPOSE 8080

CMD /etc/init.d/nginx start && npm start