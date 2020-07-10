.PHONY: all
all: zsh

.PHONY: zsh
zsh: ## Installs zsh with powerline10k and a config file.
	@./zsh.sh

.PHONY: help
help: ## Shows help.
	@echo
	@echo 'Usage:'
	@echo '    make <target>'
	@echo
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo
