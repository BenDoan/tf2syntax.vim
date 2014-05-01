" Vim syntax file
" Language: TF2 Config Files
" Maintainer: Horse M.D.
" Latest Revision: 1 May 2014

if exists("b:current_syntax")
    finish
endif

" meta
syn keyword tf2Todo contained TODO FIXME XXX NOTE
syn region tf2Comment display oneline start="//" end="$" keepend contains=tf2Todo

" values
syn match tf2Number '\d\+' contained display
syn match tf2Float '\d\+\.\d*' contained display
syn match tf2Float '\.\d\+\>' contained display

" {{{ Bind-ables
" main keyboard
syn match tf2Key "\s[a-zA-Z0-9]\s"
syn keyword tf2Key END PGDOWN PGUP UPARROW DOWNARROW LEFTARROW RIGHTARROW
syn keyword tf2Key NUMLOCK SCROLLOCK INS HOME DEL ESCAPE F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
syn keyword tf2Key = BACKSPACE TAB \ CAPSLOCK ENTER SHIFT / RSHIFT CTRL ` '
syn keyword tf2Key LWIN ALT SPACE RWIN RCTRL , . SEMICOLON -
" numpad
syn keyword tf2Key KP_SLASH KP_MULTIPLY KP_MINUS KP_PLUS KP_ENTER KP_DEL KP_INS
syn keyword tf2Key KP_HOME KP_UPARROW KP_PGUP KP_LEFTARROW KP_5 KP_RIGHTARROW
syn keyword tf2Key KP_END KP_DOWNARROW KP_PGDN
" moose
syn keyword tf2Key MWHEELUP MWHEELUP MOUSE1 MOUSE2 MOUSE3 MOUSE4 MOUSE5
" }}}

" %commands%

" {{{ Highlighting
hi def link tf2Todo Todo
hi def link tf2Comment Comment

hi def link tf2Number Constant
hi def link tf2Float Constant
hi def link tf2Command Statement
hi def link tf2Identifier Identifier
hi def link tf2Type Type
hi def link tf2Key Function
" }}}

let b:current_syntax="tf2"

