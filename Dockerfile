FROM ubuntu:16.04

MAINTAINER Tyler Long <tyler4long@gmail.com> https://github.com/tylerlong

RUN apt-get update && apt-get install git ruby ruby-dev build-essential postgresql libpq-dev node.js sudo

RUN service postgresql start && update-rc.d postgresql enable

RUN mkdir -p ~/src/ruby && cd ~/src/ruby && git clone https://github.com/tylerlong/swagger-modeller.git

RUN cd ~/src/ruby/swagger-modeller && gem install bundler && bundle install

RUN sudo -u postgres psql && create user "tyler.liu" with encrypted password 'ringcentral.c0m'; && create database swagger_modeller owner "tyler.liu"; && \q

RUN echo "local	all	tyler.liu	md5" >> /etc/postgresql/9.5/main/pg_hba.conf && service postgresql restart

COPY migrate.sql /tmp/

RUN PGPASSWORD=ringcentral.c0m psql -U tyler.liu -d swagger_modeller -f /tmp/migrate.sql

COPY database.yml ~/src/ruby/swagger_modeller/config/

RUN rails s -b 0.0.0.0
