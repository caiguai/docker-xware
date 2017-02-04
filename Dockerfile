#
# Dockerfile for xware
#

FROM debian:wheezy-slim
MAINTAINER ¹Ö²Å <admin@caiguai.net>

WORKDIR /xware

COPY ./*.deb /xware/
ADD ./xware.tar.bz /xware/bin/
COPY start.sh /xware/

RUN	dpkg -i /xware/libc6-*.deb && \
	dpkg -i /xware/lib32z1_*.deb && \
    dpkg -i /xware/libncursesw5_*.deb && \
    dpkg -i /xware/libprocps0_*.deb && \
    dpkg -i /xware/procps_*.deb && \
	chmod +x /xware/bin/portal && \
	chmod +x /xware/start.sh && \
	rm /xware/*.deb

VOLUME /xware/TDDOWNLOAD
EXPOSE 9000

CMD ["./start.sh"]