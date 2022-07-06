require "./config"
require "./socket"


def cycle()
   puts "hi"
   cycle()
end

def init()
   basic_socket = Socket.new
   puts basic_socket.@test
   basic_socket.open
   puts Config
   #cycle()
end

init()
