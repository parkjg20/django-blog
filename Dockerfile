# syntax=docker/dockerfile:experimental
FROM python:3.8.12

RUN /bin/bash

RUN python -m pip install --upgrade pip
RUN mkdir -p /sources
WORKDIR /sources

RUN apt-get update
RUN apt-get install -y net-tools \
        curl \
        vim

RUN pip install django \
        mysqlclient

ADD ./src .
EXPOSE 3000
CMD ["python", "/sources/manage.py", "runserver", "3000"]
