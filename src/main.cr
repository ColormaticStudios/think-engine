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
  modules = Hash(String, Module).new
  list_of_startup_modules = config["startup modules"].as_a
  list_of_startup_modules.each {|x|
    s = x.as_s
    modules[s] = Module.new(s)
  }
  

  #cycle()
end

init()
