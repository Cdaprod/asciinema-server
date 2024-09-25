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

# Copy necessary files to the container
COPY . /app

# Install bundler and run bundle install
RUN gem install bundler && bundle install --jobs=4 --retry=3

# Clone Asciinema Server source code into a subdirectory
RUN git clone https://github.com/asciinema/asciinema-server.git /app/asciinema-server

# Change working directory to the cloned repository
WORKDIR /app/asciinema-server

# Expose the default port
EXPOSE 4000

# Create storage directories for .cast files and database
RUN mkdir -p /app/asciinema-server/storage && mkdir -p /app/asciinema-server/db

# Set environment variables
ENV RACK_ENV=production
ENV DATABASE_URL=sqlite3:///app/asciinema-server/db/asciinema.sqlite3

# Make the start script executable
RUN chmod +x /app/start.sh

# Start the server
CMD ["./start.sh"]