FROM bitnami/node:16.19.0 as builder
COPY . /app
WORKDIR /app

RUN npm install


ENV DB_USER "won"
ENV DB_PASS "dhvmsthtm1!"
ENV DB_HOST 127.0.0.1
ENV DB_NAME "oss_db"
ENV DB_PORT 3306
ENV SERVER_PORT 3000
ENV SERVER_HOST localhost
ENV JWT_SECRET MYSECRET

EXPOSE 3000

CMD ["npm", "start"]
