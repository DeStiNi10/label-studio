# Building the main container
FROM python:3.6-slim

WORKDIR /label-studio

RUN apt-get update && apt-get install -y build-essential

# Copy and install requirements.txt first for caching
COPY requirements.txt /label-studio
RUN pip install --upgrade pip
RUN apt-get update \
    && apt-get --yes --no-install-recommends install \
        python3 python3-dev \
        # python3-pip python3-venv python3-wheel python3-setuptools \
        # libssl-dev libffi-dev \
        libpq-dev \
        gcc \
    && rm -rf /var/lib/apt/lists/*
RUN pip install -r requirements.txt

ENV PORT="8081"
ENV PROJECT_NAME="my_project"
ENV HOST=0.0.0.0
ENV PROTOCOL=http://
# basic auth params
ENV USERNAME=""
ENV PASSWORD=""

EXPOSE ${PORT}

COPY . /label-studio

RUN python setup.py develop

CMD ["./tools/run.sh"]
