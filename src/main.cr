require "./config/config"
require "./socket/socket"


def cycle()
   puts "hi"
   cycle()
end

def init()
   puts Config["test"]
   basic_socket = Socket.new
   puts basic_socket.@test
   basic_socket.function
   #cycle()
end

init()
