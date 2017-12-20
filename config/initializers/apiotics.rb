Apiotics.configure do |config|
  # The public and private keys are available on the Apiotics portal.  Navigate to your Hive's page and they will be towards the top
  #config.public_key = ENV['APIOTICS_PUBLIC'] #set this to an Environment variable
  #config.private_key = ENV['APIOTICS_PRIVATE'] #set this to an Environment variable
  config.public_key = "fe60d438d6337dff91491fee7f3e8bc81aad973682f29b9a0c7e8beaac8fd755"
  config.private_key = "98e71b7039abc04df7cebad7eede4421a2da78d3ca6ca9d9ce59316fcb78c9c4"
  
  # If your local comms server is accepting TCP connections, the local port is the port that it will accept connections on
  config.local_port = 8001
  
  # If you are deploying to a hosting service like Heroku, which does not easily permit local TCP connections, turn the redis comms connection 
  # on, and configure a Redis server to permit connections between your application and your local comms server
  config.redis_comms_connection = true
  
  # The remote port at Apiotics to initially connect to.  There should be very few reasons to change this.
  config.server_port = 8000
  
  # The Apiotics portal.  Again, very few reasons to change this.
  config.portal = "https://www.apiotics.com/"
  
  # Secure communications parameters.  The defaults should be appropriate for almost all use cases.
  config.tls = true
  config.verify_peer = true
  config.handshake = true
  
  # Local logging.  By default these are set to try and have a happy medium between the data you have in your local application's database
  # and performance.  Turning local logging on can have a significant negative impact on performance.  Turning reduced metadata on can have
  # a small positive impact on performance.  These configuration variables should be set *before* running apiotics generators.
  config.local_logging = false
  config.reduced_metadata = true
  
end