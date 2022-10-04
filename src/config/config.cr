require "json"
require "file_utils"

Default_config = %q({"startup modules": ["basic module"]})

Basic_module = %q(print("test"))

module Config
  def load_config()
    if File.file?("#{Path.home}/.local/share/think/config.json") #test if the config file exists
      config_text = File.read("#{Path.home}/.local/share/think/config.json")
      #puts "the contents of the config file is #{config_text}"
      return config_text
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
        config_text = File.read("#{Path.home}/.local/share/think/config.json")

        #ask if first time setup should be ran
        puts "since the config file was just created, should first time setup be ran? (y/n)"
				print("> ")
				option = gets
				exit if option.nil? # Ctrl+D
				option_text = option.presence
				if option_text == "y"
          #first time setup here
					FileUtils.mkdir_p("#{Path.home}/.local/share/think/modules/basic module")
          File.write("#{Path.home}/.local/share/think/modules/basic module/main.lua", Basic_module)
				end

        return config_text
      else
        if option_text == "n"
          puts "This program can't operate without a config file. If you want to run this program with a specific config location, you will need to specify --config <file>."
          exit
        else
          puts "Unknown answer. (y/n)"
        end
      end
    end
    raise "no config"
    #return JSON.parse(Default_config) #give the config as a hash
  end
end
