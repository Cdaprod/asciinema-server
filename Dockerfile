# Dockerfile
FROM ruby:3.1-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libsqlite3-dev \
    git \
    nodejs

# Set working directory
WORKDIR /app

# Copy Gemfile to the container
COPY Gemfile ./

# Install bundler and run bundle install
RUN gem install bundler && bundle install --jobs=4 --retry=3

# Clone Asciinema Server source code into a subdirectory
RUN git clone https://github.com/asciinema/asciinema-server.git /app/asciinema-server

# Change working directory to the cloned repository
WORKDIR /app/asciinema-server

# Copy the puma configuration file to the appropriate directory
COPY config/puma.rb config/puma.rb

# Expose the default port
EXPOSE 4000

# Create storage directories for .cast files and database
RUN mkdir -p /app/asciinema-server/storage && mkdir -p /app/asciinema-server/db

# Set environment variables
ENV RACK_ENV=production
ENV DATABASE_URL=sqlite3:///app/asciinema-server/db/asciinema.sqlite3

# Copy start script
COPY start.sh /app/asciinema-server/start.sh
RUN chmod +x /app/asciinema-server/start.sh

# Start the server
CMD ["./start.sh"]