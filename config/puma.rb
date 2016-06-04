#!/usr/bin/env puma

threads 0, 4
# workers 3

bind  'unix:///var/www/user-service/tmp/sockets/puma.sock'
pidfile '/var/www/user-service/tmp/pids/puma.pid'
environment 'development'
stdout_redirect '/var/www/user-service/log/puma.log'