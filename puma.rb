# config/puma.rb
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
port        ENV.fetch("PORT") { 4000 }
environment ENV.fetch("RACK_ENV") { "production" }