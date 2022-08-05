require "lua"


class Module
  def load_module(config)
    Lua.run file.new("#{Path.home}/.local/share/think/modules/#{config}/main.lua")
  end
end
