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

  def create_syntax commands_list
    data = "{{{ Commands:\n"
    commands_list.each_slice(5) { |slice| data << "syn keyword tf2Command #{slice.join(" ")}\n"}
    data << "\" }}}"
    return data
  end
end

if __FILE__ == $0
  cmds = UpdateCommands.new "%commands%"
  commands = cmds.fetch

  syntax_file = File.open("#{Dir.pwd}/new_tf2.vim", "rb")
  data = syntax_file.read
  data.gsub!("#{cmds.replacement_text}", cmds.create_syntax(commands))

  syntax_file = File.open("#{Dir.pwd}/syntax/tf2.vim", "w")
  syntax_file.write(data)
  syntax_file.close
end

