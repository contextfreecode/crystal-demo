# A very basic HTTP server
require "http/server"

def build_message(path)
  path = path.to_s
  message = if path == "/"
    "world"
  else
    path.gsub(/\W+/, " ").strip
  end
  # Does shouting clear the soul???
  message.upcase
end

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  # Output based on path.
  message = build_message(context.request.path)
  context.response.print "Hello #{message}!\n"
  # # Hardcoded output.
  # message2 = build_message(["from", 2020])
  # context.response.print "Hello #{message2}!\n"
end

puts "Listening on http://127.0.0.1:8080"
server.listen(8080)
