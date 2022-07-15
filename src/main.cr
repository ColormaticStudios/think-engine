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
  basic_socket.open
  config = load_config
  puts config
  basic_module = Module.new
  basic_module.load_module
  #cycle()
end

init()
