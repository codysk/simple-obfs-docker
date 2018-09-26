FROM alpine:3.7
MAINTAINER me@iskywind.com

VOLUME ["/conf"]

ADD ./ /home/simple-obfs

RUN { \
	apk update; \
	apk add gcc autoconf make libtool automake zlib-dev openssl asciidoc xmlto libpcre32 libev-dev g++ linux-headers; \
	cd /home/simple-obfs; \
	chmod +x entrypoint.sh; \
	cd simple-obfs; \
	./autogen.sh; \
	./configure && make; \
	make install; \
}

ENTRYPOINT ["/home/simple-obfs/entrypoint.sh"]