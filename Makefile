PLUGINS = vim/.vim

# create symlinks and install plugins
.PHONY: stow
stow: $(PLUGINS)
	stow $(filter-out Makefile, $(wildcard *))

# install vim plugins
vim/.vim:
	git clone git@github.com:VundleVim/Vundle.vim.git $@/bundle/Vundle.vim
	vim +PluginInstall +qall

# delete symlinks and plugins
.PHONY: clean
clean:
	rm -rf vim/.vim
	find */ -mindepth 1 -maxdepth 1 -exec basename {} \; | xargs -d "\n" -I {} unlink $(HOME)/{}

# backup old dotfiles
.PHONY: backup
backup:
	export BACKUP=.backup_$$(date +"%F_%T") && \
	mkdir -p $$BACKUP && \
	find */ -mindepth 1 -maxdepth 1 -exec basename {} \; | xargs -d "\n" -I {} mv $(HOME)/{} $$BACKUP

# purge backups
.PHONY: purge
purge:
	rm -rf .backup_*
