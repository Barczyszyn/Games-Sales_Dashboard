FROM mysql:8.0.16

ENV MYSQL_ROOT_PASSWORD 12345

COPY ./games_dw.sql /docker-entrypoint-initdb.d/01-games_dw.sql