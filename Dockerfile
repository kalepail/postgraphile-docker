FROM node:alpine

## Add your application to the docker image
COPY entrypoint.sh /

## Add the wait script to thdocke image
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.0.0/wait /wait

RUN chmod +x /wait && \
    apk add --update bash && \
    apk add git && \
    rm -rf /var/cache/apk/* && \
    npm install -g postgraphile && \
    cd /usr/local/lib/node_modules/postgraphile/ && \
    sed -i 's/\"graphql\": \">=0.6 <0.13\"/\"graphql\": \"0.11\"/g' package.json && \
    sed -i 's/\"graphql\": \">=0.6 <0.12\"/\"graphql\": \"0.11\"/g' package.json && \
    rm -rf node_modules package-lock.json && \
    npm install && \
    git clone https://github.com/mattbretl/postgraphile-plugin-connection-filter.git /plugins/connection-filter

EXPOSE 5000

## Launch the wait tool and then your application
CMD /wait && /entrypoint.sh