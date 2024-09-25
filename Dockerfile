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

# Clone Asciinema Server
RUN git clone https://github.com/asciinema/asciinema-server.git . 

# Install bundler and gems
RUN gem install bundler && bundle install

# Expose the default port
EXPOSE 4000

# Create storage directory for .cast files
RUN mkdir -p /app/storage && mkdir -p /app/db

# Set environment variables
ENV RACK_ENV=production
ENV DATABASE_URL=sqlite3:///app/db/asciinema.sqlite3

# Copy start script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Start the server
CMD ["./start.sh"]