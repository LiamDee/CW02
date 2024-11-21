FROM node:12.18.1

COPY server.js .

EXPOSE 8080 443

CMD ["node", "server.js"]
