#!/bin/bash
# start.sh
set -e

# Run database migrations
bundle exec rake db:migrate

# Start the Asciinema server
bundle exec puma -C config/puma.rb