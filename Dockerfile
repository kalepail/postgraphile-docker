FROM node:alpine

## Add your application to the docker image
COPY entrypoint.sh /

## Add the wait script to thdocke image
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait

RUN chmod +x /wait && \
    apk add --update bash && \
    apk add git && \
    rm -rf /var/cache/apk/* && \
    npm install -g postgraphile && \
    git clone https://github.com/mattbretl/postgraphile-plugin-connection-filter.git /plugins/connection-filter

EXPOSE 5000

## Launch the wait tool and then your application
CMD /wait && /entrypoint.sh
