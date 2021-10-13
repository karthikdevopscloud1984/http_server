require 'socket'

server = TCPServer.new('0.0.0.0', 80)

while client = server.accept
  request = client.gets
  
  method, path, version = request.lines[0].split

  puts request

  if path == "/healthcheck"
    client.print "HTTP/1.1 200\r\n"
    client.print "Content-Type: text/html\r\n"
    client.print "\r\n"
    client.write("OK")
  else
    client.print "HTTP/1.1 200\r\n"
    client.print "Content-Type: text/html\r\n"
    client.print "\r\n"
    client.write("Well, hello there!")
  end

  client.close
end
