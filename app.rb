# app.rb
require 'sinatra'
require 'json'
require 'fileutils'

# Store uploads in the storage directory
STORAGE_DIR = '/app/storage'
FileUtils.mkdir_p(STORAGE_DIR)

# Root route
get '/' do
  'Hello, Asciinema Server!'
end

# Upload endpoint - this is what asciinema client POSTs to
post '/api/asciicasts' do
  # Get the uploaded file from the request
  cast_file = params['asciicast']
  
  if cast_file
    # Generate a unique filename
    filename = "#{Time.now.to_i}-#{cast_file[:filename]}"
    path = File.join(STORAGE_DIR, filename)
    
    # Save the file
    File.open(path, 'wb') do |f|
      f.write(cast_file[:tempfile].read)
    end
    
    # Return a JSON response with the URL
    content_type :json
    { url: "#{request.base_url}/casts/#{filename}" }.to_json
  else
    status 400
    'No cast file received'
  end
end

# View endpoint - serve the stored casts
get '/casts/:filename' do |filename|
  path = File.join(STORAGE_DIR, filename)
  if File.exist?(path)
    send_file(path)
  else
    status 404
    'Cast not found'
  end
end