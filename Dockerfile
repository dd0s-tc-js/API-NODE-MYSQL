FROM node:20.9

WORKDIR /app

COPY . .

RUN npm install

ENV HOSTDB=db
ENV PORTDB=3306

EXPOSE 9000

CMD [ "node","server.js" ]