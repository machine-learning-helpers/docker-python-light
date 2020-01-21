# https://github.com/machine-learning-helpers/docker-python-alpine/tree/master/docker/alpine-3.11/Dockerfile

# See also
# * Alpine 3.11 (featuring Python 3.8.1)
# * Image on Docker Hub/Cloud: https://hub.docker.com/_/alpine
# * Dockerfile: https://github.com/alpinelinux/docker-alpine/blob/ae7bffab75367525cd3c799cb0ecafa4858e6446/x86_64/Dockerfile

FROM alpine:3.11

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
            sqlite-dev postgresql-dev libxml2-dev libxslt-dev make \
            py-scipy
RUN pip3 install -U pip
RUN pip3 install -U psutil
RUN pip3 install -U dill
RUN pip3 install -U joblib
RUN pip3 install -U numpy
RUN pip3 install -U pandas
RUN pip3 install -U pandas-datareader
RUN pip3 install -U matplotlib
RUN pip3 install -U scikit-learn
RUN pip3 install -U psycopg2
#RUN apk del .build-deps

#
#ENTRYPOINT ["/bin/bash"]
CMD /bin/bash


