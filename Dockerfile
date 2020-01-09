# https://github.com/machine-learning-helpers/docker-python-alpine/tree/master/Dockerfile

# See also
# * Python 3.7.6 Alpine 3.11
# * Image on Docker Hub/Cloud: https://hub.docker.com/layers/python/library/python/3.7.6-alpine3.11/images/sha256-303563b7b71e945c3a27f49d8cd9b58183b667437ab875639042ab253cf7af56
# * Dockerfile: https://github.com/docker-library/python/blob/d2a2b4f7422aac78c7d5ea6aadc49d009d184a5f/3.7/alpine3.11/Dockerfile
# * Alternate image: https://github.com/amancevice/docker-pandas

FROM python:3.7.6-alpine3.11

LABEL maintainer "Denis Arnaud <denis.arnaud_fedora@m4x.org>"

# Tell Docker about the Dash port
EXPOSE 8050

#
ENV HOME /root

# Install the Python dependencies
WORKDIR $HOME/dev/dash-starter
RUN apk add --no-cache pkgconfig curl wget openblas lapack libstdc++ freetype
RUN apk add --no-cache --virtual .build-deps gcc g++ gfortran \
            musl-dev libxml2-dev libxslt-dev freetype-dev linux-headers \
            openblas-dev lapack-dev py3-scipy
RUN pip install psutil \
 && pip install dill \
 && pip install joblib \
 && pip install numpy \
 && pip install pandas \
 && pip install pandas-datareader \
 && pip install seaborn
RUN pip install matplotlib
RUN pip install scikit-learn
RUN apk del .build-deps

#
#ENTRYPOINT ["sh"]
#CMD sh


