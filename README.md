tf2syntax.vim
=============

Basic syntax for tf2 cfg files for Vim.

##Credits
Sumant Manne for original tf2.vim syntax highlighting project.

##Description
Trying to provide basic syntax highlighting for Team Fortress 2's .cfg files.
All commands are pulled from the [TF2 Dev Wiki](https://developer.valvesoftware.com/wiki/List_of_TF2_console_commands_and_variables)
by the ruby script update_commands.rb. Requires Nokogiri to run.

##Installation
I'd recommend using [Vundle.vim](https://github.com/gmarik/Vundle.vim) to install this,
if you don't have any sort of plugin manager:

In your vimrc, add:

```Bundle 'horsemd/tf2syntax.vim'

Then run simply `:BundleInstall` to install.

