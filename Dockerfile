FROM ubuntu:latest
MAINTAINER Johannes Morgenroth <jm@m-network.de>

RUN apt-get -y update && apt-get install -y \
  erlang \
  git \
  python3-pip \
  python3-dev \
  libevent-dev \
  couchdb \
  libjpeg-dev \
  zlib1g-dev \
  libpng12-dev \
  libpq-dev \
  python3-virtualenv


RUN pip3 install --upgrade pip 
RUN git clone https://github.com/gpodder/mygpo.git

WORKDIR /mygpo

RUN pip3 install \
  -r requirements.txt \
  -r requirements-setup.txt

# Add Tini
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD ["gunicorn", "mygpo.wsgi:application", "--access-logfile", "-"]

# HTTP port
EXPOSE 8000
