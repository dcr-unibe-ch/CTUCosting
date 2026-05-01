# Base image https://hub.docker.com/u/rocker/
FROM rocker/shiny:latest

LABEL maintainer="Alan Haynes <alan.haynes@unibe.ch>"

RUN apt-get update -qq && \
    apt-get install -y -qq --no-install-recommends \
        libz-dev \
        libpoppler-cpp-dev \
        pandoc \
        curl \
        libssl-dev \
        libuv1-dev

# install Arial
# 1. Enable 'multiverse' component for Ubuntu 24.04
RUN sed -i 's/Components: main universe/Components: main universe restricted multiverse/' /etc/apt/sources.list.d/ubuntu.sources

# 2. Install fontconfig and pre-accept Microsoft EULA
RUN apt-get update && apt-get install -y --no-install-recommends fontconfig && \
    echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

# 3. Install fonts and refresh cache
RUN apt-get update && \
    apt-get install -y --no-install-recommends ttf-mscorefonts-installer && \
    fc-cache -f -v && \
    rm -rf /var/lib/apt/lists/*

# install quarto
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb

RUN Rscript -e 'install.packages(c("pak", "websocket"))'

RUN Rscript -e 'pak::pkg_install("dcr-unibe-ch/CTUCosting", dependencies = TRUE)'

RUN chown -R shiny:shiny /usr/local/lib/R/site-library/CTUCosting/app/

USER shiny

EXPOSE 3838

CMD ["R", "-e", "CTUCosting::run_costing_app(opts = list(host = '0.0.0.0', port = 3838))"]
