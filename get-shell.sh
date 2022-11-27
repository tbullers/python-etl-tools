#!/bin/bash

#this scripts launches the docker image and puts you at a bash prompt as the default user
docker run -it --volume $(pwd)/scripts:/home/python-etl/scripts python-etl:1.0 /bin/bash
