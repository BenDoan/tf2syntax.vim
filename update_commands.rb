require 'nokogiri'
require 'open-uri'

class UpdateCommands
  attr_reader :replacement_text

  def initialize txt="%commands%"
    @replacement_text = txt
  end

  # Fetch all the commands from valve's developer wiki that lists all the tf2
  # console commands.
  def fetch
    url = "https://developer.valvesoftware.com/wiki/List_of_TF2_console_commands_and_variables"
    doc = Nokogiri::HTML(open(url)).css("pre")
    commands = []
    for section in doc # commands are separated in <pre>'s, alphabetically. 27 in total. (first one is _)
      for line in section.inner_text.split("\n")
        word = line.split(" ")[0]
        commands << word unless word.nil?
      end
    end
    return commands
  end

  # The text to replace %commands% or whatever you passed to the constructor with.
  # Create the "syn keyword tf2Command a b c" lines. Also addes fold markers to
  # ease the fact that this is about 700 lines long; 3000 or so commands.
  def create_syntax commands_list
    data = "{{{ Commands:\n"
    commands_list.each_slice(5) do |slice| 
      data << "syn keyword tf2Command #{slice.join(" ").downcase}\n"
    end
    data << "\" }}}"
    return data
  end
end

if __FILE__ == $0
  cmds = UpdateCommands.new "%commands%"
  commands = cmds.fetch

  # read the template into variable data
  syntax_file = File.open("#{Dir.pwd}/template.vim", "rb")
  data = syntax_file.read
  syntax_file.close

  # replace %commands% with the commands downloaded from the tf2 dev wiki
  data.gsub!("#{cmds.replacement_text}", cmds.create_syntax(commands))

  syntax_file = File.open("#{Dir.pwd}/syntax/tf2.vim", "w")
  syntax_file.write(data)
  syntax_file.close
end

