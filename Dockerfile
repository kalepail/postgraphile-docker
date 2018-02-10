FROM node:alpine

RUN apk add --update bash && \
    apk add git && \
    rm -rf /var/cache/apk/* && \
    npm install -g postgraphql@next && \
    git clone https://github.com/mattbretl/postgraphile-plugin-connection-filter.git

EXPOSE 5000
ENTRYPOINT ["postgraphql", "-n", "0.0.0.0", "-o", "-a", "-j", "--append-plugins", "/postgraphile-plugin-connection-filter/index.js"]