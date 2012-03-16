1. Backup your settings first!
```bash
~ $ mv .vim .vim.old && mv .vimrc .vimrc.old && mv .gvimrc .gvimrc.old
```

2. Install
```bash
~ $ git clone git://github.com/zacstewart/.vim.git
~ $ cd .vim
~ $ git submodule update
~ $ ln -s ~/.vim/rc/.vimrc ~/.vimrc
~ $ ln -s ~/.vim/rc/.gvimrc ~/.gvimrc

3. Build Command-T
~ $ cd ~/.vim/bundles/command-t/ruby/command-t
~ $ rvm use system # ensure you are using system Ruby!
~ $ ruby extconfig.rb
~ $ make
