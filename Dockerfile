FROM node:alpine

RUN apk add --update bash && \
    apk add git && \
    rm -rf /var/cache/apk/* && \
    npm install -g postgraphile && \
    cd /usr/local/lib/node_modules/postgraphile/ && \
    sed -i 's/\"graphql\": \">=0.6 <0.13\"/\"graphql\": \"0.11\"/g' package.json && \
    sed -i 's/\"graphql\": \">=0.6 <0.12\"/\"graphql\": \"0.11\"/g' package.json && \
    rm -rf node_modules package-lock.json && \
    npm install && \
    cd / && \
    git clone https://github.com/mattbretl/postgraphile-plugin-connection-filter.git

EXPOSE 5000
ENTRYPOINT ["postgraphile", "-n", "0.0.0.0", "-s", "public", "-o", "-a", "-j", "-M", "--append-plugins", "/postgraphile-plugin-connection-filter/index.js"]