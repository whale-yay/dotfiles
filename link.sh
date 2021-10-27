# make backup directory
if [ ! -d ~/dotfiles/temp ];then mkdir ~/dotfiles/temp; fi

# bashrc symboric link
if [ ! -L ~/.bashrc ]; then
  mv ~/.bashrc ~/dotfiles/temp/.bashrc
  ln -s ~/dotfiles/bashrc ~/.bashrc;
fi

# vim config symboric link
if [ ! -L ~/.config/nvim ]; then 
  if [ ! -d ~/dotflies/temp/nvim ]; then mkdir ~/dotfiles/temp/nvim; fi
  mv ~/.config/nvim ~/dotfiles/temp/nvim/init.vim;
  ln -s ~/dotfiles/nvim ~/.config/nvim;
fi
