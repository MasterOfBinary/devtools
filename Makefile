.PHONY: all
all: zsh nvim screen

.PHONY: zsh
zsh: ## Installs oh-my-zsh with powerline10k theme and config files.
	@./zsh.sh

.PHONY: nvim
nvim: ## Sets up nvim with plugins and config files.
	@./nvim.sh

.PHONY: screen
screen: ## Sets up screen.
	@./screen.sh

.PHONY: help
help: ## Shows help.
	@echo
	@echo 'Usage:'
	@echo '    make <target>'
	@echo
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo
