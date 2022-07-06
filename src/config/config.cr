require "json"


Config = Hash(Int32, Int32).from_json(File.read("./config.json"))
