Docker light images to support Machine Learning (ML) in Python
==============================================================

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/infrahelpers/python-light)](https://hub.docker.com/repository/docker/infrahelpers/python-light/general)
[![Docker Repository on Quay](https://quay.io/repository/artificialintelligence/python-light/status "Docker Repository on Quay")](https://quay.io/repository/artificialintelligence/python-light)

# Overview
[That project](https://github.com/machine-learning-helpers/docker-python-light)
produces light [OCI](https://opencontainers.org/)
[(Docker-compliant) images](https://hub.docker.com/repository/docker/infrahelpers/python-light/tags),
which provide Python environments, ready to use and to develop with
Artificial Intelligence (AI), Machine Learning (ML) and
Data Science. These images are based on the
[latest Python-ready Linux distributions](https://hub.docker.com/_/python).

As well explained in
[a PythonSpeed article from June 2023](https://pythonspeed.com/articles/base-image-python-docker-images/),
the best light images for Python production operations are based on Debian
(the latest stable release being, as of end 2023,
[Debian 12, also known as Bookworm](https://www.debian.org/releases/bookworm/)).
For historical reasons (and for the challenge!), Alpine-based distributions
are still maintained too.

These Python OCI light images are aimed at deploying Data Science
applications on operational environments such as cloud-based Kubernetes
clusters or services (_e.g._,
[AWS EKS](https://aws.amazon.com/eks),
[Azure AKS](https://azure.microsoft.com/en-us/services/kubernetes-service/),
[IBM/RedHat OpenShift v4](https://www.redhat.com/en/openshift-4) or
[Google GKE](https://cloud.google.com/kubernetes-engine)).

The author of this repository also maintains Data Science Python OCI images
for every day development purposes in a
[dedicated GitHub repository](https://github.com/machine-learning-helpers/docker-python-jupyter/)
and
[Docker Hub space](https://hub.docker.com/repository/docker/infrahelpers/python-jupyter).
Thanks to
[Docker multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/),
one can easily have in the same Docker specification files two images, one for
every day data science work, and the other one to deploy the corresponding
applications onto production environments.

The Docker images of this repository just add some standard ML-related Python
packages such as NumPy, Pandas and Dash/Plotly, on top of the native images
maintained by the
[Docker Python project](https://github.com/docker-library/python):
* [Python 3.12](https://github.com/docker-library/python/tree/master/3.12/)
  + [Python 3.12 - Debian Bookworm](https://github.com/docker-library/python/tree/master/3.12/bookworm)
  + [Python 3.12 - Debian Bullseye](https://github.com/docker-library/python/tree/master/3.12/bullseye)
  + [Python 3.12 - Alpine 3.19](https://github.com/docker-library/python/tree/master/3.12/alpine3.19)
* [Python 3.11](https://github.com/docker-library/python/tree/master/3.11/)
  + [Python 3.11 - Debian Bookworm](https://github.com/docker-library/python/tree/master/3.11/bookworm)
  + [Python 3.11 - Debian Bullseye](https://github.com/docker-library/python/tree/master/3.11/bullseye)
  + [Python 3.11 - Alpine 3.19](https://github.com/docker-library/python/tree/master/3.11/alpine3.19)
* [Python 3.10](https://github.com/docker-library/python/tree/master/3.10/)
  + [Python 3.10 - Debian Bookworm](https://github.com/docker-library/python/tree/master/3.10/bookworm)
  + [Python 3.10 - Debian Bullseye](https://github.com/docker-library/python/tree/master/3.10/bullseye)
* [Python 3.9](https://github.com/docker-library/python/tree/master/3.9/)
  + [Python 3.9 - Debian Bookworm](https://github.com/docker-library/python/tree/master/3.9/bookworm)
  + [Python 3.9 - Debian Bullseye](https://github.com/docker-library/python/tree/master/3.9/bullseye)
* [Python 3.8](https://github.com/docker-library/python/tree/master/3.8/)
  + [Python 3.8 - Debian Bookworm](https://github.com/docker-library/python/tree/master/3.8/bookworm)
  + [Python 3.8 - Debian Bullseye](https://github.com/docker-library/python/tree/master/3.8/bullseye)

In the OCI image, Python packages are installed by the `pip` utility.
For testing purposes, outside of the container, Python virtual environments
may be installed thanks to Pyenv and `pipenv`, as detailed in the
[dedicated procedure](http://github.com/machine-learning-helpers/induction-python/tree/master/installation/virtual-env)
on the
[Python induction notebook sub-project](http://github.com/machine-learning-helpers/induction-python).

Any additional Python module may be installed either:
* With `pip` and some `requirements.txt` dependency specification file:
```bash
$ python -mpip install -r requirements.txt
```
* In a dedicated virtual environment, controlled by `pipenv` through
  local `Pipfile` (and potentially `Pipfile.lock`) files, which should
  be versioned:
```bash
$ pipenv --rm; pipenv install; pipenv install --dev
```

On the other hand, the OCI images install those modules globally.

The Docker images of this repository are intended to run any collection
of Dash applications.

## See also
* [Images on Docker Cloud](https://cloud.docker.com/u/infrahelpers/repository/docker/infrahelpers/python-light)

* [Images on Quay.io](https://quay.io/repository/infrahelpers/python-light)

* General purpose light Python/Debian/Alpine OCI image:
  https://github.com/machine-learning-helpers/docker-python-light

* [Native Python OCI images](https://github.com/docker-library/python):
  + [Python 3.12](https://github.com/docker-library/python/tree/master/3.12)
    - https://github.com/docker-library/python/tree/master/3.12/bookworm
    - https://github.com/docker-library/python/tree/master/3.12/bullseye
    - https://github.com/docker-library/python/tree/master/3.12/alpine3.19
  + [Python 3.11](https://github.com/docker-library/python/tree/master/3.11)
    - https://github.com/docker-library/python/tree/master/3.11/bookworm
    - https://github.com/docker-library/python/tree/master/3.11/bullseye
    - https://github.com/docker-library/python/tree/master/3.11/alpine3.19
  + [Python 3.10](https://github.com/docker-library/python/tree/master/3.10)
    - https://github.com/docker-library/python/tree/master/3.10/bookworm
    - https://github.com/docker-library/python/tree/master/3.10/bullseye
  + [Python 3.9](https://github.com/docker-library/python/tree/master/3.9)
    - https://github.com/docker-library/python/tree/master/3.9/bookworm
    - https://github.com/docker-library/python/tree/master/3.9/bullseye
  + [Python 3.8](https://github.com/docker-library/python/tree/master/3.8)
    - https://github.com/docker-library/python/tree/master/3.8/bookworm
    - https://github.com/docker-library/python/tree/master/3.8/bullseye
  + [Python 3.7](https://github.com/docker-library/python/tree/master/3.7)
    - https://github.com/docker-library/python/tree/master/3.7/bookworm
    - https://github.com/docker-library/python/tree/master/3.7/bullseye

* [Debian releases](https://wiki.debian.org/DebianReleases)
  + [Debian 12 Bookworm](https://wiki.debian.org/DebianBookworm)
  + [Debian 11 Bullseye](https://wiki.debian.org/DebianBullseye)

* [Alpine Linux releases](https://wiki.alpinelinux.org/wiki/Alpine_Linux:Releases)
  + [Alpine 3.19](https://wiki.alpinelinux.org/wiki/Release_Notes_for_Alpine_3.19.0)
  + [Alpine 3.18](https://wiki.alpinelinux.org/wiki/Release_Notes_for_Alpine_3.18.0)

# Simple use
* Download the Docker image:
```bash
$ docker pull infrahelpers/python-light
```

* Launch Dash or Flask within the Docker image (where `<port>` corresponds
  to the local port on which Dash or Flask is launched; the default is 8050):
```bash
$ docker run -d -p <port>:8050 infrahelpers/python-light
```

## Interact with the Dash application in a Web browser
The sample Dash application (run from the Docker image)
is now available on the Web browser: http://localhost:8050
Note that the port (8050 by default) may be changed as per your convenience.

# Build your own container image
* Clone the
  [Git repository](https://github.com/machine-learning-helpers/docker-python-light):
```bash
$ mkdir -p ~/dev/ml && cd ~/dev/ml
$ git clone https://github.com/machine-learning-helpers/docker-python-light.git
$ cd docker-python-light
```

* Build the OCI images (here with Docker, but any other tool may be used):
  + Python 3.12
    - `py312-bookworm` tag: Debian Bookworm / Python 3.12:
```bash
$ docker build -t infrahelpers/python-light:py312-bookworm python-3.12-bookworm
```
    - `py312-bullseye` tag: Debian Bullseye / Python 3.12:
```bash
$ docker build -t infrahelpers/python-light:py312-bullseye python-3.12-bullseye
```
    - `py312-alp319` tag: Alpine 3.19 / Python 3.12:
```bash
$ docker build -t infrahelpers/python-light:py312-alp319 python-3.12-alpine-3.19
```
  + Python 3.11
    - `py311-bookworm` tag: Debian Bookworm / Python 3.11:
```bash
$ docker build -t infrahelpers/python-light:py311-bookworm python-3.11-bookworm
```
    - `py311-bullseye` tag: Debian Bullseye / Python 3.11:
```bash
$ docker build -t infrahelpers/python-light:py311-bullseye python-3.11-bullseye
```
    - `py311-alp319` tag: Alpine 3.19 / Python 3.11:
```bash
$ docker build -t infrahelpers/python-light:py311-alp319 python-3.11-alpine-3.19
```
  + Python 3.10
    - `py310-bookworm` tag: Debian Bookworm / Python 3.10:
```bash
$ docker build -t infrahelpers/python-light:py310-bookworm python-3.10-bookworm
```
    - `py310-bullseye` tag: Debian Bullseye / Python 3.10:
```bash
$ docker build -t infrahelpers/python-light:py310-bullseye python-3.10-bullseye
```
  + Python 3.9
    - `py39-bookworm` tag: Debian Bookworm / Python 3.9:
```bash
$ docker build -t infrahelpers/python-light:py39-bookworm python-3.9-bookworm
```
    - `py39-bullseye` tag: Debian Bullseye / Python 3.9:
```bash
$ docker build -t infrahelpers/python-light:py39-bullseye python-3.9-bullseye
```
  + Python 3.8
    - `py38-bookworm` tags: Debian Bookworm / Python 3.8:
```bash
$ docker build -t infrahelpers/python-light:py38-bookworm python-3.8-bookworm
```
    - `latest`/`py38-bullseye` tags: Debian Bullseye / Python 3.8:
```bash
$ docker build -t infrahelpers/python-light:py38-bullseye python-3.8-bullseye
```

* (Optional) Push the newly built images to Docker Hub.
  That step is usually not needed, as the images are automatically
  built everytime there is
  [a change on GitHub](https://github.com/machine-learning-helpers/docker-python-light/commits/master))
```bash
$ docker login
$ docker push infrahelpers/python-light:py312-bookworm
$ docker push infrahelpers/python-light:py312-bullseye
$ docker push infrahelpers/python-light:py312-alp319
$ docker push infrahelpers/python-light:py311-bookworm
$ docker push infrahelpers/python-light:py311-bullseye
$ docker push infrahelpers/python-light:py311-alp319
$ docker push infrahelpers/python-light:py310-bookworm
$ docker push infrahelpers/python-light:py310-bullseye
$ docker push infrahelpers/python-light:py39-bookworm
$ docker push infrahelpers/python-light:py39-bullseye
$ docker push infrahelpers/python-light:py38-bookworm
$ docker push infrahelpers/python-light:py38-bullseye
$ docker push infrahelpers/python-light:alp319-py311
$ docker push infrahelpers/python-light:alp318-py311
```

* (Optional) Push the newly built images to Quay.io.
  That step is usually not needed, as the images are automatically
  built everytime there is
  [a change on GitHub](https://github.com/machine-learning-helpers/docker-python-light/commits/master))
	+ Login to Quay:
```bash
$ docker login quay.io
```
	+ Python 3.11:
```bash
$ docker tag infrahelpers/python-light:py311-bookworm quay.io/artificialintelligence/python-light:py311-bookworm
$ docker push quay.io/artificialintelligence/python-light:py311-bookworm
#
$ docker tag infrahelpers/python-light:py311-bullseye quay.io/artificialintelligence/python-light:py311-bullseye
$ docker push quay.io/artificialintelligence/python-light:py311-bullseye
```
	+ Python 3.10:
```bash
$ docker tag infrahelpers/python-light:py310-bookworm quay.io/artificialintelligence/python-light:py310-bookworm
$ docker push quay.io/artificialintelligence/python-light:py310-bookworm
#
$ docker tag infrahelpers/python-light:py310-bullseye quay.io/artificialintelligence/python-light:py310-bullseye
$ docker push quay.io/artificialintelligence/python-light:py310-bullseye
```
	+ Python 3.9:
```bash
$ docker tag infrahelpers/python-light:py39-bookworm quay.io/artificialintelligence/python-light:py39-bookworm
$ docker push quay.io/artificialintelligence/python-light:py39-bookworm
#
$ docker tag infrahelpers/python-light:py39-bullseye quay.io/artificialintelligence/python-light:py39-bullseye
$ docker push quay.io/artificialintelligence/python-light:py39-bullseye
```
	+ Python 3.8:
```bash
$ docker tag infrahelpers/python-light:py38-bookworm quay.io/artificialintelligence/python-light:py38-bookworm
$ docker push quay.io/artificialintelligence/python-light:py38-bookworm
#
$ docker tag infrahelpers/python-light:py38-bullseye quay.io/artificialintelligence/python-light:py38-bullseye
$ docker push quay.io/artificialintelligence/python-light:py38-bullseye
```

* Shutdown the Docker image
```bash
$ docker ps
CONTAINER ID IMAGE                    COMMAND                   CREATED        STATUS        PORTS                  NAMES
7b69efc9dc9a ai/python-light          "/bin/sh -c 'python …"    48 seconds ago Up 47 seconds 0.0.0.0:9000->8050/tcp vigilant_merkle
$ docker kill vigilant_merkle
vigilant_merkle
$ docker ps
CONTAINER ID IMAGE                    COMMAND                   CREATED        STATUS        PORTS                  NAMES
```

