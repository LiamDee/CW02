FROM node:6.14.2

COPY server.js .

EXPOSE 8080 443

CMD node server.js
