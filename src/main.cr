CONFIG = {
   "test" => "let's go"
}


def cycle()
   puts "hi"
   cycle()
end

def init()
   puts CONFIG["test"]
   cycle()
end

init()
