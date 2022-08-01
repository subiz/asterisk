FROM ubuntu:22.04

RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt update && apt install -y apt-utils unixodbc-dev odbcinst1debian2 odbcinst libodbc1 unixodbc dnsutils curl xmlstarlet subversion build-essential libssl-dev openssl libedit-dev file uuid-dev libxml2-dev sqlite3 libsqlite3-dev
# xmlstarlet is required to use opus codec

# build libsrtp
ADD libsrtp-1.5.4.tar.gz ./
WORKDIR libsrtp-1.5.4
RUN ./configure CFLAGS=-fPIC --prefix=/usr/lib64
RUN make
RUN make install

WORKDIR /
# build asterisk 18.13.0
ADD asterisk-18-current.tar.gz ./
WORKDIR asterisk-18.13.0
RUN ./configure --with-jansson-bundled --with-srtp=/usr/lib64 --libdir=/usr/lib64

ADD menuselect.makeopts ./
RUN make -j 4 menuselect.makeopts
RUN make install

# install orable mysql odbc driver
# see https://dev.mysql.com/doc/connector-odbc/en/connector-odbc-installation-binary-unix-tarball.html
WORKDIR /
ADD mysql-connector-odbc-8.0.29-linux-glibc2.12-x86-64bit.tar.gz ./
RUN cp -R ./mysql-connector-odbc-8.0.29-linux-glibc2.12-x86-64bit/bin/* /usr/local/bin
RUN cp -R ./mysql-connector-odbc-8.0.29-linux-glibc2.12-x86-64bit/lib/* /usr/local/lib
RUN myodbc-installer -a -d -n "MySQL ODBC 8.0 Driver" -t "Driver=/usr/local/lib/libmyodbc8w.so"
RUN myodbc-installer -a -d -n "MySQL ODBC 8.0" -t "Driver=/usr/local/lib/libmyodbc8a.so"
# verify install
RUN myodbc-installer -d -l
