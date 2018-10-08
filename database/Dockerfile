FROM mysql:latest
ENV MYSQL_USER=notes-api \
    MYSQL_PASSWORD=notes-api \
    MYSQL_DATABASE=notes \ 
    MYSQL_ROOT_PASSWORD=12345 \
    MYSQL_ROOT_HOST=localhost \
    STARTUP_SQL=database_schema.sql
COPY database_schema.sql /docker-entrypoint-initdb.d/
EXPOSE 3306
