#!/bin/bash
# start.sh
set -e

# Start the Asciinema server
bundle exec puma -C config/puma.rb config/config.ru