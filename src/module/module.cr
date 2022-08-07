require "lua"


class Module
  def load_module(module_to_load)
    file_to_run = File.read("#{Path.home}/.local/share/think/modules/#{module_to_load}/main.lua")
    Lua.run file_to_run
  end
end
