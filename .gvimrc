if has("gui_macvim")
  " Remap New Tab shortcut
  macmenu &File.New\ Tab key=<D-T>
  " Remap New Window shortcut
  macmenu &File.New\ Window key=<D-N>
  " Disable ⌘f annoyingness
  macmenu &Edit.Find.Find\.\.\. key=<D-F>
  " Hide toolbar
  set guioptions=egmrt
endif
