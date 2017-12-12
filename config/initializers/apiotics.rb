Apiotics.configure do |config|
  config.public_key = ENV["APIOTICS_PUBLIC"] #set this to an Environment variable
  config.private_key = ENV["APIOTICS_PRIVATE"] #set this to an Environment variable
  config.local_port = 8001
  config.server_port = 8000
  config.portal = "https://www.apiotics.com/"
  config.tls = true
  config.verify_peer = true
  config.handshake = true
  config.local_logging = false
  config.reduced_metadata = false
  config.production_host = nil
end