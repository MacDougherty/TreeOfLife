Apiotics.configure do |config|
  config.public_key = "fe60d438d6337dff91491fee7f3e8bc81aad973682f29b9a0c7e8beaac8fd755" #set this to an Environment variable
  config.private_key = "98e71b7039abc04df7cebad7eede4421a2da78d3ca6ca9d9ce59316fcb78c9c4" #set this to an Environment variable
  config.local_port = 8001
  config.server_port = 8000
  config.portal = "https://www.apiotics.com/"
  config.tls = true
  config.verify_peer = true
  config.handshake = true
  config.local_logging = false
  config.reduced_metadata = false
  config.production_host = "tree-of-life.herokuapp.com"
end