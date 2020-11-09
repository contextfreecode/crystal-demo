# Demo based on examples at crystal-lang.org
# A very basic HTTP server
require "http/server"

def make_message(path)
  path = path.to_s
  message = if path == "/"
    "world"
  else
    path.gsub(/\W+/, " ").strip
  end
  # Does shouting clear the soul???
  message.upcase
end

port = 2020

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  # Output based on path.
  message = make_message(context.request.path)
  context.response.print "Hello #{message}!\n"
  # Hardcoded output.
  message2 = make_message(["from", port])
  context.response.print "Hello #{message2}!\n"
end

puts "Listening on http://127.0.0.1:#{port}"
server.listen(port)
