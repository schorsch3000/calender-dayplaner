FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m libreoffice; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
                                                  libdbus-glib-1-2 \
                                                  libsm6 \
                                                  openjdk-7-jre \
                                                  libreoffice \
                                                  php5-cli \
                                                  unzip \
                                                  zip \
                                                  pdfjam \
                                                  poppler-utils \
                                                  texlive-latex-recommended \
                                                  ghostscript \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/share/i18n/SUPPORTED /var/lib/locales/supported.d/all \
    && locale-gen



