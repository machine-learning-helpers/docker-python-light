#
# Source: https://github.com/machine-learning-helpers/docker-python-alpine/tree/master/docker/alpine-3.12/Dockerfile
# On Docker Hub: https://hub.docker.com/repository/docker/artificialintelligence/python-alpine/general
#
# See also
# * Alpine 3.12 (featuring Python 3.8.5)
# * Image on Docker Hub/Cloud: https://hub.docker.com/_/alpine
# * Dockerfile: https://github.com/alpinelinux/docker-alpine/blob/v3.12/x86_64/Dockerfile

FROM alpine:3.12

LABEL maintainer "Denis Arnaud <denis.arnaud_fedora@m4x.org>"

# Tell Docker about the server port
EXPOSE 5000

#
ENV HOME /root

# Copy the Python dependency files
COPY requirements.txt requirements-dev.txt $HOME/

# Install the Python dependencies
WORKDIR $HOME
RUN apk update && \
    apk add --no-cache net-tools tzdata sudo curl wget less htop \
            bzip2-dev xz-dev zlib-dev util-linux-dev coreutils \
            dpkg-dev dpkg expat-dev findutils \
            libstdc++ gdbm-dev libc-dev \
            man-pages bash bash-doc bash-completion git vim \
            musl linux-headers build-base ca-certificates \
            gcc g++ gfortran cython file libffi-dev libressl-dev \
            musl-dev lapack-dev openblas-dev libstdc++ freetype-dev \
            libnsl-dev ncurses-dev libressl-dev readline-dev \
            sqlite-dev postgresql-dev libxml2-dev libxslt-dev make
RUN apk add --no-cache py3-pip py3-setuptools py3-wheel py3-pytest py3-tox py3-psutil
RUN python3 -mpip install -U twine dill joblib
RUN python3 -mpip install -U numpy pandas pandas-datareader matplotlib seaborn scikit-learn
RUN python3 -mpip install -U psycopg2
RUN python3 -mpip install -U sphinx tox poetry build twine
RUN python3 -mpip install -U flake8 black mypy
RUN python3 -mpip install -U pyjq
RUN python3 -mpip install -U protobuf simplejson
RUN python3 -mpip install -U opentraveldata OpenTrepWrapper neobase
#RUN apk del .build-deps

#
#ENTRYPOINT ["/bin/bash"]
CMD /bin/bash


