PLUGINS = vim/.vim
PKGS = $(filter-out Makefile, $(wildcard *))

# create symlinks and install plugins
.PHONY: stow
stow: $(PLUGINS)
	stow $(PKGS)

# install vim plugins
vim/.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git $@/bundle/Vundle.vim
	vim +PluginInstall +qall

# delete symlinks and plugins
.PHONY: clean
clean:
	rm -rf $(PLUGINS)
	@stow -D $(PKGS)

# move old dotfiles to backup
.PHONY: backup
backup:
	@export BACKUP=.backup_$$(date +"%F_%T") && \
	mkdir -p $$BACKUP && \
	find */ -mindepth 1 -maxdepth 1 -exec basename {} \; | xargs -d "\n" -I {} mv $(HOME)/{} $$BACKUP

# purge backups
.PHONY: purge
purge:
	rm -rf .backup_*
