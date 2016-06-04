FROM ubuntu:14.04

# Install nginx
RUN apt-get update
RUN apt-get install -y \
    nginx \
    build-essential \
    curl \
    ruby-dev \
    vim

# Install rvm, ruby and bundler
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.1"
RUN /bin/bash -l -c "rvm gemset use global && gem install bundler --no-ri --no-rdoc"

ADD . /var/www/user-service

# Configure nginx as a reverse proxy
ADD ./docker/nginx/virtualhost.conf /etc/nginx/sites-enabled/user-service.conf

# Download service dependencies
RUN /bin/bash -l -c "source /usr/local/rvm/scripts/rvm"

#WORKDIR /var/www/user-service
RUN /bin/bash -l -c "cd /var/www/user-service && bundle"