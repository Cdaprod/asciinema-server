# config/config.ru
require_relative '../app' # Adjust the path if your main application file is in a different location
run Sinatra::Application