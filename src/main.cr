require "./config"
require "./socket"
require "./module"
require "json"


def cycle()
  puts "hi"
  cycle()
end


def init()
  config = JSON.parse(load_config())
  
  #start the server before loading the modules
  channel = Channel(Nil).new
  spawn do
  	start_server(config["socket"]["port"], channel)
  end
  
  channel.receive
  
  modules = Hash(String, Module).new
  list_of_startup_modules = config["startup modules"].as_a
  list_of_startup_modules.each {|x|
    s = x.as_s
    modules[s] = Module.new(s)
  }
  
#  spawn puts("first hi")
#  Fiber.yield
#  puts "second hi"
  

  #cycle()
end

init()
