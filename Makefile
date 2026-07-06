install: ## [Local development] Install package.
	uv sync

install-dev: ## [Local development] Install package with dev dependency group
	uv sync --group dev

lint: ## [Local development] Run mypy, pylint and black
	uv run mypy open_flamingo
	uv run pylint open_flamingo
	uv run black --check -l 120 open_flamingo

black: ## [Local development] Auto-format python code using black
	uv run black -l 120 .

.PHONY: help

help: # Run `make help` to get help on the make commands
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
