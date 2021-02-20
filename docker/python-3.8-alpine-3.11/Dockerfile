#
# https://github.com/machine-learning-helpers/docker-python-light/tree/master/docker/python-3.8-alpine-3.11/Dockerfile
#

# See also
# * Python 3.8.5 Alpine 3.11
# * Image on Docker Hub/Cloud: https://hub.docker.com/layers/python/library/python/3.8.5-alpine3.11/images/sha256-9b46c6e1121918263d4ec634b8a6c29ff4c28fa50a07dd116ad2f9a013e90425?context=explore
# * Dockerfile: https://github.com/docker-library/python/blob/master/3.8/alpine3.11/Dockerfile
#
# * Alternate images:
#   + Apline Python: https://github.com/jfloff/alpine-python
#   + Docker Pandas: https://github.com/amancevice/docker-pandas
#

FROM python:3.8.5-alpine3.11

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
            man man-pages bash bash-doc bash-completion git vim \
            musl linux-headers build-base ca-certificates \
            gcc g++ gfortran cython file libffi-dev libressl-dev \
            musl-dev lapack-dev openblas-dev libstdc++ freetype-dev \
            libnsl-dev ncurses-dev libressl-dev readline-dev \
            sqlite-dev postgresql-dev libxml2-dev libxslt-dev make jq \
            py-scipy

RUN pip3 install -U pip \
 && pip3 install -U psutil \
 && pip3 install -U dill \
 && pip3 install -U joblib \
 && pip3 install -U numpy \
 && pip3 install -U pandas \
 && pip3 install -U pandas-datareader
RUN pip3 install -U psycopg2
RUN pip3 install -U matplotlib
RUN pip3 install -U scikit-learn
#RUN apk del .build-deps

#
#ENTRYPOINT ["/bin/bash"]
CMD ["/bin/bash"]

