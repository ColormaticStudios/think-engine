require "lua"


class Module
  @script : Lua::Stack
  @script = Lua.load
  def initialize(module_to_load)
    begin
      #Yes, the connection between the lua script and this program counts as a socket.
      @script.run(File.read("#{Path.home}/.local/share/think/modules/#{module_to_load}/main.lua"))
      
    rescue File::NotFoundError
      puts "Module #{module_to_load} was not found."
    end
  end
#  def run(args) #this code doesn't work, replaced with a web server in socket.cr
#    @script = Lua.load
#    @script.run(args)
#  end
end
