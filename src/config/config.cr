require "json"
require "file_utils"

Default_config = %q({
  "startup modules": [
    "basic_module"
  ]
}
)

module Config
  def load_config()
    if File.file?("#{Path.home}/.local/share/think/config.json") #test if the config file exists
      config_text = File.read("#{Path.home}/.local/share/think/config.json")
      #puts "the contents of the config file is #{config_text}"
      config = JSON.parse(config_text) #if so, load it
      return config
    else
      puts "It seems the config file at #{Path.home}/.local/share/think/config.json doesn't exist. create it now? (y/n)" #if the config file dosen't exist, ask the user if it should be created
      print("> ")
      option = gets
      exit if option.nil? # Ctrl+D
      option_text = option.presence
      if option_text == "y"
        if !File.directory?("#{Path.home}/.local/share/think/")
          FileUtils.mkdir("#{Path.home}/.local/share/think")
        end
        File.write("#{Path.home}/.local/share/think/config.json", Default_config) #create the config file
        return JSON.parse(Default_config)
      else
        if option_text == "n"
          puts "This program can't operate without a config file. If you want to run this program with a specific config location, you will need to specify --config <file>."
          exit
        else
          puts "Unknown answer. (y/n)"
        end
      end
    end
    #return JSON.parse(Default_config) #give the config as a hash
  end
end
