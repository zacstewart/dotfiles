# VIM

Taking this entire vim setup is probably a bad idea. You'll rip
yourself off if you don't learn what all of it does.

All plugin-like things are installed as Git submodules in `bundle/`.
To update individual plugins, cd into it's dir, checkout master,
pull, return to dotfile root dir and commit changes to the submodule.

## Windows Navigation

Navigating splits and tabs is mapped to be the sames as it is in my tmux config.

* ctrl-w h - select split to left
* ctrl-w j - select split below
* ctrk-w k - select split above
* ctrl-w l - select split to right
* ctrl-w c - create a new tab
* ctrl-w n - switch to next tab (mapped to `:tabnext<CR>`)
* ctrl-w p - switch to previous tab (mapped to `:tabprevious<CR>`)

## File Navigation

Files are indexed in each git repo in a hidden file named `.file-index`.

Double tapping ctrl-p launches fzf to fuzzy-search them. Within fuzzy search,
ctrl-v will open the selected file in a vertical split, ctrl-x opens it in a
horizontal split, and enter will open it in the current split.

Files will be reindexed if .file-index is not present, or you can reindex it at
any time by hitting ctrl-p ONCE and waiting (don't double tap).

(These keystrokes are intentionally overlapping. Reindexing can take a long
time, and this gives me a chance to cancel it by tapping ctrl-p again.)

You can view the PWD file tree with NERDTree by hitting <Leader>d.

## Wishlist

- [ ] `:set spell` underlines spelling errors in comments, but not strings
