# https://git.signintra.com/gdsa/gdsa-induction-web-app-dash/tree/master/tsccloud/np/Dockerfile

# See also
# * Python 3.7.6 Alpine 3.11
# * Image on Docker Hub/Cloud: https://hub.docker.com/layers/python/library/python/3.7.6-alpine3.11/images/sha256-303563b7b71e945c3a27f49d8cd9b58183b667437ab875639042ab253cf7af56
# * Dockerfile: https://github.com/docker-library/python/blob/d2a2b4f7422aac78c7d5ea6aadc49d009d184a5f/3.7/alpine3.11/Dockerfile

FROM python:3.7.6-alpine3.11

LABEL maintainer "Denis Arnaud <denis.arnaud_fedora@m4x.org>"
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url=$VCS_URL

# Tell Docker about the Dash port
EXPOSE 8050

#
ENV HOME /root

# Python Dash starter (also featured in
# https://git.signintra.com/data-strategy-and-analytics/data-sources-knowledge-base/tree/master/visualization/dash)
RUN mkdir -p $HOME/dev/dash-starter
COPY dash-starter $HOME/dev/dash-starter/
COPY requirements.txt requirements-dev.txt $HOME/dev/dash-starter/

# Install the Python dependencies for Dash
WORKDIR $HOME/dev/dash-starter
RUN apk add --no-cache --virtual .build-deps gcc g++ libstdc++ musl-dev libxml2-dev libxslt-dev linux-headers \
 && pip install psutil \
 && pip install cython \
 && pip install numpy \
 && pip install -r requirements.txt \
 && pip install -r requirements-dev.txt \
 && apk del .build-deps

#
#ENTRYPOINT ["/bin/bash"]
CMD python dash-simple-example-pandas-datareader.py


