require "./libsocket/socket"

CONFIG = {
   "test" => "let's go"
}


def cycle()
   puts "hi"
   cycle()
end

def init()
   puts CONFIG["test"]
   puts Socket::Test
   #cycle()
end

init()
