# Base image https://hub.docker.com/u/rocker/
FROM rocker/shiny:latest

LABEL maintainer="Alan Haynes <alan.haynes@unibe.ch>"

RUN apt-get update -qq && \
    apt-get install -y -qq --no-install-recommends \
        libz-dev \
        libpoppler-cpp-dev \
        pandoc \
        curl

RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb

RUN Rscript -e 'install.packages(c("remotes"))'

RUN Rscript -e 'remotes::install_github("CTU-Bern/CTUCosting", dependencies = TRUE)'

RUN chown -R shiny:shiny /usr/local/lib/R/site-library/CTUCosting/app/

USER shiny

EXPOSE 3838

CMD ["R", "-e", "CTUCosting::run_costing_app(opts = list(host = '0.0.0.0', port = 3838))"]
