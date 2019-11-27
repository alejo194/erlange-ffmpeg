FROM erlang:18-slim
COPY ./odbc/ /tmp/odbc
RUN set -xe \
        && apt-get update \
        && apt-get install -y freetds-bin freetds-dev tdsodbc \
        && cp -rp /tmp/odbc/* /etc \
        && ln -s /etc/odbc.ini /usr/local/etc/ \
        && ln -s /etc/odbcinst.ini /usr/local/etc/
