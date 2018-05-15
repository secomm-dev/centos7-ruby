FROM centos:7.4.1708

MAINTAINER Soulblade "phuocvu@builtwithdigital.com"

# Installing Requirements
RUN yum groupinstall -y "Development tools" \ 
    && yum install -y which \
    && curl -sSL https://rvm.io/mpapis.asc | gpg --import - \
    && curl -L get.rvm.io | bash -s stable \
    && yum clean all

# Install ruby 2.4.2 & bundler
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.4.2"
RUN /bin/bash -l -c "rvm use 2.4.2 --default"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install sinatra"

RUN mkdir /app
WORKDIR /app

# Start server
ENV PORT 80
EXPOSE 80
