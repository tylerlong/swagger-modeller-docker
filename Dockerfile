FROM ubuntu:16.04

MAINTAINER Tyler Long <tyler4long@gmail.com> https://github.com/tylerlong

RUN apt-get update && apt-get install -y git ruby ruby-dev build-essential postgresql libpq-dev node.js sudo

RUN mkdir -p ~/src/ruby && cd ~/src/ruby && git clone https://github.com/tylerlong/swagger-modeller.git

RUN cd ~/src/ruby/swagger-modeller && gem install bundler && bundle install

RUN service postgresql start && sudo -u postgres psql --command "create user \"tyler.liu\" with encrypted password 'ringcentral.c0m';" && sudo -u postgres psql --command "create database swagger_modeller owner \"tyler.liu\";"

RUN echo "local all tyler.liu md5\n\n$(cat /etc/postgresql/9.5/main/pg_hba.conf)" > /etc/postgresql/9.5/main/pg_hba.conf

COPY migrate.sql /tmp/

RUN service postgresql start && PGPASSWORD=ringcentral.c0m psql -U tyler.liu -d swagger_modeller -f /tmp/migrate.sql

COPY database.yml ~/src/ruby/swagger_modeller/config/

EXPOSE 3000
