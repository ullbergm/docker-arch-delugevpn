FROM binhex/arch-delugevpn
MAINTAINER ullbergm

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="Deluge" \
    org.label-schema.description="Deluge container with dependencies for sickbeard_mp4_automator" \
    org.label-schema.url="http://ullberg.us/docker/deluge" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/ullbergm/docker-deluge" \
    org.label-schema.vendor="Magnus Ullberg" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

# install compiled packages using pacman
RUN 	pacman -S --noconfirm --needed ffmpeg python-pip && \
	pip install requests && \
	pip install requests[security] && \
	pip install requests-cache && \
	pip install babelfish && \
	pip install "guessit<2" && \
	pip install deluge-client && \
	pip install gevent && \
	pip install qtfaststart && \
	pip install "subliminal<2" && \
	pip install stevedore==1.19.1
