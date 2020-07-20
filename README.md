Docker light (Alpine) images to support Machine Learning (ML) in Python
=======================================================================

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/artificialintelligence/python-alpine)](https://hub.docker.com/repository/docker/artificialintelligence/python-alpine/general)
[![Docker Repository on Quay](https://quay.io/repository/artificialintelligence/python-alpine/status "Docker Repository on Quay")](https://quay.io/repository/artificialintelligence/python-alpine)

# Overview
[That project](https://github.com/machine-learning-helpers/docker-python-alpine)
produces
[Docker images](https://cloud.docker.com/u/artificialintelligence/repository/docker/artificialintelligence/python-alpine),
which provide ready-to-use Artificial Intelligence (AI) / Machine Learning (ML)
Python Pandas/Dash environments on the
[latest Alpine (light) Linux distribution](https://hub.docker.com/layers/python/library/python/3.7.6-alpine3.11/images/sha256-303563b7b71e945c3a27f49d8cd9b58183b667437ab875639042ab253cf7af56).

The Docker images just add some standard ML-related Python packages such as
NumPy, Pandas and Dash/Plotly, on top of other general purpose Python/Alpine
Docker image produced by a
[dedicated project on GitHub](https://github.com/docker-library/python/tree/master/3.7/alpine3.11/Dockerfile).

In the Python/Alpine Docker image, Python packages are installed by the `pip`
utility. For testing purposes, outside of the Docker container,
Python virtual environments may be installed thanks to Pyenv and `pipenv`,
as detailed in the
[dedicated procedure](http://github.com/machine-learning-helpers/induction-python/tree/master/installation/virtual-env)
on the
[Python induction notebook sub-project](http://github.com/machine-learning-helpers/induction-python).
Any additional Python module may be installed in a dedicated
virtual environment, controlled by `pipenv` through local `Pipfile`
(and `Pipfile.lock`) files, which should be versioned.

On the other hand, the Docker images install those modules globally.

That Docker image is intended to run any collection of Dash applications.

## See also
* [Images on Docker Cloud](https://cloud.docker.com/u/artificialintelligence/repository/docker/artificialintelligence/python-alpine)
* General purpose light Python/Alpine Docker image:
  https://github.com/machine-learning-helpers/docker-python-alpine
* Native Python/Alpine Docker images:
  + https://github.com/docker-library/python/tree/master/3.8/alpine3.12
  + https://github.com/docker-library/python/tree/master/3.8/alpine3.11
  + https://github.com/docker-library/python/tree/master/3.7/alpine3.12
  + https://github.com/docker-library/python/tree/master/3.7/alpine3.11

# Simple use
* Download the Docker image:
```bash
$ docker pull artificialintelligence/python-alpine
```

* Launch Dash or Flask within the Docker image (where `<port>` corresponds
  to the local port on which Dash or Flask is launched; the default is 8050):
```bash
$ docker run -d -p <port>:8050 artificialintelligence/python-alpine
```

## Interact with the Dash application in a Web browser
The sample Dash application (run from the Docker image)
is now available on the Web browser: http://localhost:8050
Note that the port (8050 by default) may be changed as per your convenience.

# Build your own Docker image
* Clone the
  [Git repository](https://github.com/machine-learning-helpers/docker-python-alpine):
```bash
$ mkdir -p ~/dev/ml && cd ~/dev/ml
$ git clone https://github.com/machine-learning-helpers/docker-python-alpine.git
$ cd docker-python-alpine
```

* Build the Docker image:
```bash
$ docker build -t artificialintelligence/python-alpine:py37-alp-311 docker/python-3.7-alpine-3.11
$ docker images
REPOSITORY                            TAG           IMAGE ID     CREATED            SIZE
artificialintelligence/python-alpine  latest        33a1ad533140 About a minute ago 500MB
```

* (Optional) Push the newly built image to Docker Cloud.
  That step is usually not needed, as the images are automatically
  built everytime there is
  [a change on GitHub](https://github.com/machine-learning-helpers/docker-python-alpine/commits/master))
```bash
$ docker login
$ docker push artificialintelligence/python-alpine:py37-alp311
```

* Shutdown the Docker image
```bash
$ docker ps
CONTAINER ID IMAGE                    COMMAND                   CREATED        STATUS        PORTS                  NAMES
7b69efc9dc9a ai/python-alpine         "/bin/sh -c 'python …"    48 seconds ago Up 47 seconds 0.0.0.0:9000->8050/tcp vigilant_merkle
$ docker kill vigilant_merkle
vigilant_merkle
$ docker ps
CONTAINER ID IMAGE                    COMMAND                   CREATED        STATUS        PORTS                  NAMES
```

