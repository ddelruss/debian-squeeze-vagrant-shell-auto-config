#!/usr/bin/env bash

# {{{ Ubuntu utilities

<%= import 'ubuntu.sh' %>

# }}}

# Use Google Public DNS for resolving domain names.
# The default is host-only DNS which may not be installed.
nameservers-local-purge
nameservers-append '8.8.8.8'
nameservers-append '8.8.4.4'


# Install VM packages.
apt-get update --fix-missing

# libruby1.8 is the ee version of ruby1.8
apt-packages-install     \
  mysql-server-5.1       \
  mysql-client           \
  libmysql-ruby          \
  libruby1.8             \
  sphinxsearch           \
  ffmpeg                 \
  aspell                 \
  aspell-es              \
  imagemagick            \
  librmagick-ruby        \
  libmagick9-dev         \
  texlive                \
  texlive-xetex          \
  git                    \
  libxml2-dev            \
  libxslt1-dev           \
  libmysqlclient15-dev   \
  libaspell-dev

#  git-core               \ this works, but we don't need git on the VM


# Allow unsecured remote access to MySQL.
#mysql-remote-access-allow

# Set passwords - only do this the first time, will not work on reload/provision after up command.
mysqladmin -u root -h localhost password 'password'
#mysqladmin -u root -h myhostname password 'mypassword'

# Restart MySQL service for changes to take effect.
mysql-restart

#RVM
#rvm install ree-1.8.7-2010.02
#rvm --create use ree-1.8.7-2010.02@democracynow.org

gem install bundler
# export PATH=/var/lib/gems/1.8/bin/:${PATH}
