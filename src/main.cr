require "./config"
require "./socket"
require "./module"
require "json"
include Config


def cycle()
  puts "hi"
  cycle()
end


def init()
  basic_socket = Socket.new
  #puts basic_socket.@test
  basic_socket.open()
  config = JSON.parse(load_config())
  #puts config_text
  basic_module = Module.new
  puts config["startup modules"]
  #cycle()
end

init()
