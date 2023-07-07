require "http/server"
require "json"


class Socket
   @test = "thing"
   def open()
      #puts "this is a function"
   end
end


def start_server(port, channel)
	sockets = [] of HTTP::WebSocket
	ws_handler = HTTP::WebSocketHandler.new do |socket|
	puts "Socket opened"
		sockets << socket
	socket.on_message do |message|
		  sockets.each { |socket| socket.send "Echo back from server: #{message}" }
		end
	socket.on_close do
		  puts "Socket closed"
		end
	end
	server = HTTP::Server.new([ws_handler])
	address = server.bind_tcp "0.0.0.0", port.as_i
	puts "Listening on http://#{address}"
	server.listen
	
	channel.send(nil)
end
