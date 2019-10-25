FROM erlang:18-slim
ENV FFMPEG_VERSION="3.3.4"
RUN set -xe \
       && FFMPEG_URL="http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.bz2" \
       && fetchDeps=' \
                wget' \
        && apt-get update \
        && apt-get install -y --no-install-recommends $fetchDeps \
       && runtimeDeps=' \
                libodbc1 \
                libssl1.0.2 \
                libsctp1 \
        ' \
        && buildDeps=' \
                autoconf \
                dpkg-dev \
                gcc \
                g++ \
                make \
                libncurses-dev \
                unixodbc-dev \
                libssl1.0-dev \
                libsctp-dev \
                yasm \
        ' \
        && apt-get install -y --no-install-recommends $runtimeDeps \
        && apt-get install -y --no-install-recommends $buildDeps \
        && export FFM_TOP="/usr/src/ffmpeg" \
        && mkdir -vp $FFM_TOP \
        && wget "$FFMPEG_URL" \
        && tar xjvf ffmpeg-3.3.4.tar.bz2 -C $FFM_TOP \
        && ( cd $FFM_TOP/ffmpeg-3.3.4 \
          && ./configure --prefix=/var/ffmpeg --enable-shared \
          && make \
          && make install ) \
        && find /usr/local -name examples | xargs rm -rf \
        && apt-get purge -y --auto-remove $buildDeps $fetchDeps \
        && rm -rf $FFM_TOP /var/lib/apt/lists/* \
        && cp -rp /var/ffmpeg/bin/* /usr/local/bin \
        && echo "/var/ffmpeg/lib" >> /etc/ld.so.conf \
        && ldconfig
