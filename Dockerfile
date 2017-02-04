FROM ubuntu:16.04
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="0.2"
LABEL version="0.2"
LABEL software="iso2flux"

ENV ISO2FLUX_REVISION "5b6b550a7cb4cd40cc557f779dc76ec143c6bb84"

RUN apt-get -y update && apt-get -y install --no-install-recommends git libglpk-dev \
                      libxml2-dev libxslt1-dev python-dev python-pip pkg-config zlib1g-dev python-tk libssl-dev && \
    pip install --upgrade pip && pip install -U setuptools && \
    pip install urllib3[secure] && pip install -e git+https://github.com/cfoguet/iso2flux.git@$ISO2FLUX_REVISION#egg=iso2flux && \
    apt-get purge -y git python-pip python-dev zlib1g-dev pkg-config libpng-dev libxml2-dev libxslt1-dev zlib1g-dev && \
    apt-get install -y --no-install-recommends python python-dev gcc && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["run_iso2flux.py"]
