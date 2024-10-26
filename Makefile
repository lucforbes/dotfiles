.PHONY: stow
stow: vim/.vim/bundle/Vundle.vim
	stow $(filter-out Makefile, $(wildcard *))

vim/.vim/bundle/Vundle.vim:
	git clone git@github.com:VundleVim/Vundle.vim.git vim/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
