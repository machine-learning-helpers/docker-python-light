#
# Source: https://github.com/machine-learning-helpers/docker-python-light/tree/master/python-3.11-alpine-3.19/Dockerfile
# On Docker Hub: https://hub.docker.com/repository/docker/artificialintelligence/python-light/general
# Usual Docker tag: py311-alp319 (infrahelpers/python-light:py311-alp319)
#
# See also:
# * Python 3.11 Alpine 3.19:
#   + Image on Docker Hub/Cloud: https://hub.docker.com/_/python?tab=tags&page=1&name=3.11-alpine3.19
#   + Dockerfile: https://github.com/docker-library/python/blob/master/3.11/alpine3.19/Dockerfile
# * The best Docker base image for your Python application, Jun. 2023:
#   https://pythonspeed.com/articles/base-image-python-docker-images/
# * Alpine 3.19 (featuring Python 3.12.2)
#   + Image on Docker Hub/Cloud: https://hub.docker.com/_/alpine
#   + Dockerfile: https://github.com/alpinelinux/docker-alpine/blob/v3.19/x86_64/Dockerfile
#
FROM python:3.11-alpine3.19

LABEL authors="Denis Arnaud <denis.arnaud_github at m4x dot org>"

# Tell Docker about the server port
EXPOSE 5000

#
ENV HOME /root

# Install the Python dependencies
WORKDIR $HOME
RUN apk update && \
    apk add net-tools tzdata sudo curl wget less htop \
            bzip2-dev xz-dev zlib-dev util-linux-dev coreutils \
            dpkg-dev dpkg expat-dev findutils \
            libstdc++ gdbm-dev libc-dev \
	    autoconf automake libtool \
            man-pages bash bash-doc bash-completion git vim \
            musl linux-headers build-base ca-certificates \
            gcc libgcc g++ gfortran cython file libffi-dev \
            musl-dev lapack-dev openblas-dev freetype-dev \
	    openssl-dev libnsl-dev \
            ncurses-dev readline-dev tk-dev tcl-dev lcms2-dev \
	    jpeg-dev openjpeg-dev tiff-dev \
            sqlite-dev postgresql-dev libxml2-dev libxslt-dev make jq \
	    python3-dev py3-pip py3-setuptools py3-wheel py3-pytest py3-tox \
	    py3-psutil py3-scipy \
            rust cargo

RUN python3 -mpip install -U pip
RUN python3 -mpip install -U build
RUN python3 -mpip install -U dill joblib
RUN python3 -mpip install -U twine
RUN python3 -mpip install -U sphinx poetry
RUN python3 -mpip install -U flake8 black mypy
RUN python3 -mpip install -U simplejson
#RUN python3 -mpip install -U pyjq
RUN python3 -mpip install -U pyyaml
RUN python3 -mpip install -U protobuf
RUN python3 -mpip install -U numpy
RUN python3 -mpip install -U pandas
RUN python3 -mpip install -U pandas-datareader
RUN python3 -mpip install -U matplotlib
RUN python3 -mpip install -U seaborn
RUN python3 -mpip install -U scikit-learn
RUN python3 -mpip install -U psycopg2
RUN python3 -mpip install -U opentraveldata OpenTrepWrapper neobase

RUN rm -rf /var/cache/apk/*
#RUN apk del .build-deps

#
#ENTRYPOINT ["/bin/bash"]
CMD ["/bin/bash"]

