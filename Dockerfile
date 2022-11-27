FROM python:3.11-slim-bullseye as python-etl

# Define the default user name in the container
ARG USERNAME=python-etl

COPY requirements.txt ./

# gcc required for pip compilation of modules
# libxml and libc6-dev required for db2 drivers
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc \
    && apt-get install -y --no-install-recommends libc6-dev \
    && apt-get install -y --no-install-recommends libxml2 \
    && pip install --no-cache-dir -r requirements.txt

# create user account, directory, and set bash as shell
RUN useradd --create-home --shell /bin/bash $USERNAME

# [Optional] Set the default user.
USER $USERNAME
WORKDIR /home/$USERNAME
