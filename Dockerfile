FROM node:6.14.2

COPY index.html /usr/share/nginx/html
COPY server.js .

EXPOSE 8080 443

CMD ["nginx", "-g", "daemon off;"]
CMD node server.js
