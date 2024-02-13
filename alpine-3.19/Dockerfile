#
# Source: https://github.com/machine-learning-helpers/docker-python-light/tree/master/alpine-3.19/Dockerfile
# On Docker Hub: https://hub.docker.com/repository/docker/infrahelpers/python-light/general
# Usual Docker tag: alp319-py311 (infrahelpers/python-light:alp319-py311)
#
# See also
# * Alpine 3.19 (featuring Python 3.11.6)
# * Image on Docker Hub/Cloud: https://hub.docker.com/_/alpine
# * Dockerfile: https://github.com/alpinelinux/docker-alpine/blob/v3.19/x86_64/Dockerfile
#
FROM alpine:3.19

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

RUN python3 -mvenv $HOME/.venv
RUN . $HOME/.venv/bin/activate && python -mpip install -U pip
RUN . $HOME/.venv/bin/activate && python -mpip install -U build
RUN . $HOME/.venv/bin/activate && python -mpip install -U wheel
RUN . $HOME/.venv/bin/activate && python -mpip install -U scikit-build
RUN . $HOME/.venv/bin/activate && python -mpip install -U dill joblib
RUN . $HOME/.venv/bin/activate && python -mpip install -U twine
RUN . $HOME/.venv/bin/activate && python -mpip install -U sphinx
#RUN . $HOME/.venv/bin/activate && python -mpip install -U poetry
RUN . $HOME/.venv/bin/activate && python -mpip install -U flake8 black mypy
RUN . $HOME/.venv/bin/activate && python -mpip install -U simplejson
#RUN . $HOME/.venv/bin/activate && python -mpip install -U pyjq
RUN . $HOME/.venv/bin/activate && python -mpip install -U pyyaml
RUN . $HOME/.venv/bin/activate && python -mpip install -U protobuf
RUN . $HOME/.venv/bin/activate && python -mpip install -U numpy
RUN . $HOME/.venv/bin/activate && python -mpip install -U pandas
RUN . $HOME/.venv/bin/activate && python -mpip install -U pandas-datareader
RUN . $HOME/.venv/bin/activate && python -mpip install -U matplotlib
RUN . $HOME/.venv/bin/activate && python -mpip install -U seaborn
RUN . $HOME/.venv/bin/activate && python -mpip install -U scikit-learn
RUN . $HOME/.venv/bin/activate && python -mpip install -U connexion requests
#RUN . $HOME/.venv/bin/activate && python -mpip install -U flask flask_restful
RUN . $HOME/.venv/bin/activate && python -mpip install -U psycopg2
RUN . $HOME/.venv/bin/activate && python -mpip install -U opentraveldata OpenTrepWrapper neobase

RUN rm -rf /var/cache/apk/*
#RUN apk del .build-deps

#
#ENTRYPOINT ["/bin/bash"]
CMD ["/bin/bash"]

