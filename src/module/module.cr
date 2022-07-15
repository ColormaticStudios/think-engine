require "lua"


class Module
  def load_module
    Lua.run %q{
      local hello_message = table.concat({ "Hello", "from", "Lua!" }, " ")
      print(hello_message)
    } # => prints "Hello from Lua!"
  end
end
