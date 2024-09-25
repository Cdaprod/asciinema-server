#!/bin/bash
# start.sh
set -e

# Start the Asciinema server
bundle exec puma -C puma.rb config.ru