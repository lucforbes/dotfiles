PKGS = $(filter-out Makefile, $(wildcard *))

# create symlinks and install plugins
.PHONY: stow
stow: plug
	stow $(PKGS)

.PHONY: plug
plug: vim/.vim/bundle/Vundle.vim tmux/.tmux/plugins/tpm

# install Vundle
vim/.vim/bundle/Vundle.vim:
	git clone git@github.com:VundleVim/Vundle.vim.git $@

# install tmux plugin manager
tmux/.tmux/plugins/tpm:
	git clone git@github.com:tmux-plugins/tpm.git $@

# delete symlinks
.PHONY: clean
clean:
	stow -D $(PKGS)

# move old dotfiles to backup
.PHONY: backup
backup:
	export BACKUP=.backup_$$(date +"%F_%T") && \
	mkdir -p $$BACKUP && \
	find */ -mindepth 1 -maxdepth 1 -exec basename {} \; | xargs -d "\n" -I {} mv $(HOME)/{} $$BACKUP

# purge backups
.PHONY: purge
purge:
	rm -rf .backup_*
