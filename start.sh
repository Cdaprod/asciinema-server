#!/bin/bash
# start.sh
set -e

# Start the Asciinema server using the absolute path to puma.rb
bundle exec puma -C /app/puma.rb /app/config.ru