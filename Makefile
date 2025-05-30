.PHONY: all
all: zsh nvim tmux go

.PHONY: zsh
zsh: ## Installs oh-my-zsh with powerline10k theme and config files.
	@./zsh.sh

.PHONY: nvim
nvim: ## Sets up nvim with plugins and config files.
	@./nvim.sh

.PHONY: tmux
tmux: ## Sets up tmux with gpakosz/.tmux configuration.
	@./tmux.sh

.PHONY: go
go: ## Sets up go directories.
	@./go.sh

.PHONY: help
help: ## Shows help.
	@echo
	@echo 'Usage:'
	@echo '    make <target>'
	@echo
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo
