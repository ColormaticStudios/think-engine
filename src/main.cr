require "./libsocket/socket"

Config = {
   "test" => "let's go"
}


def cycle()
   puts "hi"
   cycle()
end

def init()
   puts Config["test"]
   puts Socket::Test
   #cycle()
end

init()
