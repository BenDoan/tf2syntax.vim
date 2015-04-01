tf2syntax.vim
=============

Basic syntax for Team Fortress 2 .cfg files for Vim.

##Notes
Update template.vim if you want to change any syntax; syntax/tf2.vim gets 
rewritten by `update_commands.rb`.

##Credits
Sumant Manne for the original tf2.vim syntax highlighting project.

##Description
Trying to provide basic syntax highlighting for Team Fortress 2's .cfg files.
All commands are pulled from the [TF2 Dev Wiki](https://developer.valvesoftware.com/wiki/List_of_TF2_console_commands_and_variables)
by the ruby script `update_commands.rb`. Requires [Nokogiri](http://nokogiri.org) to run.

##Installation
I'd recommend using [Vundle.vim](https://github.com/gmarik/Vundle.vim) to install this,
if you don't have any sort of plugin manager:

In your vimrc, add:

    Plugin 'BenDoan/tf2syntax.vim'

Then simply run `:PluginInstall` to install.

