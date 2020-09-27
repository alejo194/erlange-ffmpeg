FROM erlang:18-slim
COPY . /tmp/odbc
RUN set -xe \
        && apt-get update \
        && apt-get install -y freetds-bin freetds-dev tdsodbc wget \
        && cp -rp /tmp/odbc/* /etc \
        && ln -s /etc/odbc.ini /usr/local/etc/ \
        && ln -s /etc/odbcinst.ini /usr/local/etc/ \
        && rm -rf /tmp/odbc \
        ## mysql odbc
        && cd /tmp \
        && wget https://cdn.mysql.com/archives/mysql-connector-odbc-5.3/mysql-connector-odbc-5.3.13-linux-debian8-x86-64bit.tar.gz \
        && tar -zxvf mysql-connector-odbc-5.3.13-linux-debian8-x86-64bit.tar.gz \
        && cd mysql-connector-odbc-5.3.13-linux-debian8-x86-64bit/lib \
        && cp -rp * /usr/lib/x86_64-linux-gnu/odbc
