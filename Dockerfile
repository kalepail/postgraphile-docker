FROM node:alpine

## Add your application to the docker image
COPY entrypoint.sh /

## Add the wait script to the docker image
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.5.0/wait /wait

RUN chmod +x /wait && \
    npm install --no-save postgraphile@next postgraphile-plugin-connection-filter@latest

EXPOSE 5000

## Launch the wait tool and then your application
CMD /wait && /entrypoint.sh
