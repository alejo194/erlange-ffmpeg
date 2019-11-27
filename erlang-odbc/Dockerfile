FROM erlang:18-slim
COPY ./odbc/ /tmp/odbc
RUN set -xe \
        && apt-get update \
        && apt-get install -y freetds-bin freetds-dev tdsodbc \
        && cp -rp /tmp/odbc/* /etc \
        && ln -s /etc/{odbc.ini,odbcinst.ini} /usr/local/etc/
