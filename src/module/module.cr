require "lua"


class Module
  def load_module(module_to_load)
    Lua.run File.read("#{Path.home}/.local/share/think/modules/#{module_to_load}/main.lua")
  end
end
