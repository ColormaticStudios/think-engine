require "lua"


class Module
  def load_module(module_to_load)
	begin
    Lua.run File.read("#{Path.home}/.local/share/think/modules/#{module_to_load}/main.lua")
    rescue File::NotFoundError
      puts "The config said to load module #{module_to_load}, however it was not found."
    end
  end
end
