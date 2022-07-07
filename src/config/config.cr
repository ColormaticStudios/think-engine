require "json"
require "file_utils"

Default_config = "{}"

module Config
  def load_config()
    if File.file?("#{Path.home}/.local/share/think/config.json") #test if the config file exists
      config = JSON.parse(File.read("#{Path.home}/.local/share/think/config.json")) #if so, load it
    else
      puts "It seems the config file at #{Path.home}/.local/share/think/config.json doesn't exist. create it now? (y/n)" #if the config file dosen't exist, ask the user if it should be created
      option = gets
      exit if option.nil? # Ctrl+D
      option_text = option.presence
      if option_text == "y"
        if !File.directory?("#{Path.home}/.local/share/think/")
          FileUtils.mkdir("#{Path.home}/.local/share/think")
        end
        config = File.open("#{Path.home}/.local/share/think/config.json", "w") #create the config file
        config.print(Default_config)
        return Default_config
      else
        if option_text == "n"
          puts "This program can't operate without a config file. If you want to run this program with a specific config location, you will need to specify --config <file>."
          exit
        else
          puts "Unknown answer. (y/n)"
        end
      end
    end
    return JSON.parse(Default_config) #give the config as a hash
  end
end
