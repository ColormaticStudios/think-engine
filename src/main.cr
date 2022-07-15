require "./config"
require "./socket"
require "./module"


def cycle
  puts "hi"
  cycle()
end

include Config

def init
  basic_socket = Socket.new
  #puts basic_socket.@test
  #basic_socket.open
  puts load_config
  #cycle()
end

init()
