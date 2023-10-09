#
# Source: https://github.com/machine-learning-helpers/docker-python-light/tree/master/docker/python-3.12-bookworm/Dockerfile
# On Docker Hub: https://hub.docker.com/repository/docker/infrahelpers/python-light/general
# Usual Docker tag: py312-bookworm (infrahelpers/python-light:py312-bookworm)
#

# See also:
# * Python 3.12 Debian Bookworm:
#   + Image on Docker Hub/Cloud: https://hub.docker.com/_/python?tab=tags&page=1&name=3.12-bookworm
#   + Dockerfile: https://github.com/docker-library/python/blob/master/3.12/bookworm/Dockerfile
# * The best Docker base image for your Python application, Apr. 2020:
#   https://pythonspeed.com/articles/base-image-python-docker-images/
# * General purpose Debian 12 (Bookworm) C++/Python development image:
#   + Docker Hub: https://cloud.docker.com/u/infrahelpers/repository/docker/infrahelpers/cpppython
#   + Dockerfile: https://github.com/cpp-projects-showcase/docker-images/tree/master/debian12
#
FROM python:3.12-bookworm

LABEL authors="Denis Arnaud <denis.arnaud_github at m4x dot org>"

# Tell Docker about the server port
EXPOSE 5000

# Environment
ENV container docker
ENV HOME /root
ENV LANGUAGE en_US:en
ENV LANG en_US.UTF-8
ENV LANG4GEN en_US.utf8
ENV LC_ALL $LANG

# Update the system
#RUN echo "Europe/Paris" > /etc/timezone
RUN echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/90-yes
RUN apt-get -qq update && apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends \
	apt-utils apt-transport-https \
	ca-certificates locales locales-all tzdata sudo \
	zip unzip gzip bzip2 xz-utils tar p7zip-full \
	curl wget netcat-traditional net-tools aptitude

# Generate the locales
RUN locale-gen $LANG && \
	update-locale LANG=$LANG LANGUAGE=$LANGUAGE LC_ALL=$LC_ALL

# Configure the time-zone
RUN dpkg-reconfigure -f noninteractive tzdata

# Basic, C++ and Python packages
RUN apt-get -qq update && \
    apt-get -y install procps less htop screen \
	git keychain gawk \
	bash-completion vim-nox emacs-nox apt-utils keyutils ftp \
	zlib1g-dev libbz2-dev \
	lsb-release libgmp-dev \
	gcc g++ cppcheck clang cmake manpages patch pkg-config \
	m4 autoconf automake libtool libltdl-dev build-essential \
	flex bison \
	libboost-all-dev libxapian-dev \
	libreadline-dev libncurses5-dev \
	libzmq5-dev libczmq-dev libssl-dev libffi-dev \
	swig graphviz libopenblas-dev
RUN apt-get -y install libmpich-dev libopenmpi-dev \
	sqlite3 libsqlite3-dev \
	mariadb-client default-libmysqlclient-dev \
	postgresql-client \
	libpqxx-dev \
	libicu-dev libprotobuf-dev protobuf-compiler \
	python3 libpython3-dev \
	libgeos++-dev \
	doxygen ghostscript texlive-latex-recommended \
	r-base r-base-dev \
	rake \
	jq
#RUN apt-get -y install python3-django libapache2-mod-wsgi-py3

# Cleaning
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# yq, the YAML CLI utility like jq, for YAML (https://github.com/mikefarah/yq)
RUN YQ_VER=$(curl -Ls https://api.github.com/repos/mikefarah/yq/releases/latest | grep 'tag_name' | cut -d'v' -f2 | cut -d'"' -f1) && \
	curl -Ls \
         https://github.com/mikefarah/yq/releases/download/v${YQ_VER}/yq_linux_amd64 \
         -o /usr/local/bin/yq && \
    chmod 775 /usr/local/bin/yq

# SOCI (https://github.com/SOCI/soci)
RUN mkdir -p /opt/soci
ADD resources/soci-debian-cmake.patch /opt/soci/soci-debian-cmake.patch
RUN SOCI_VER=$(curl -Ls https://api.github.com/repos/SOCI/soci/tags|jq -r '.[].name'|grep "^v"|sort -r|head -1|cut -d'v' -f2,2) && \
	curl -Ls \
         https://github.com/SOCI/soci/archive/refs/tags/v${SOCI_VER}.tar.gz \
         -o /opt/soci/soci-${SOCI_VER}.tar.gz && cd /opt/soci && \
    tar zxf soci-${SOCI_VER}.tar.gz && rm -f soci-${SOCI_VER}.tar.gz && \
    cd soci-${SOCI_VER} && patch -p1 < ../soci-debian-cmake.patch && \
    mkdir -p build && cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
          -DSOCI_CXX11=ON -DSOCI_TESTS=OFF .. && \
    make install

# Set up the packaging environment for the `build` user
ADD resources/bashrc $HOME/.bashrc
ADD resources/gitconfig $HOME/.gitconfig
ADD resources/vimrc $HOME/.vimrc
RUN chmod 640 $HOME/.bashrc $HOME/.gitconfig $HOME/.vimrc

# Install a few Python modules for data science
WORKDIR $HOME
RUN python3 -mpip install -U pip
RUN python3 -mpip install -U psutil dill joblib
RUN python3 -mpip install -U setuptools wheel build scikit-build
RUN python3 -mpip install -U pytest tox twine
#RUN python3 -mpip install -U pyjq pyyaml
RUN python3 -mpip install -U numpy pandas pandas-datareader
RUN python3 -mpip install -U scikit-learn
RUN python3 -mpip install -U matplotlib seaborn
RUN python3 -mpip install -U dash flask flask_restful connexion requests
RUN python3 -mpip install -U ipython jupyterlab
RUN python3 -mpip install -U opentraveldata OpenTrepWrapper Neobase
RUN python3 -mpip install -U elasticsearch kafka-python
RUN python3 -mpip install -U psycopg2

#
CMD ["/bin/bash"]


