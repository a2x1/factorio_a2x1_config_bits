# Makefile

NAME = $(shell jq .name info.json -r)
VERSION = $(shell jq .version info.json -r)

help:
	@echo "Available Commands"
	@echo "\tmake build"
	@echo "\tmake publish"

.DEFAULT_GOAL := help

build:
	rm -rf $(NAME)_$(VERSION).zip || true
	cd .. && zip -r $(NAME)/$(NAME)_$(VERSION).zip \
		--exclude=./$(NAME)/*.zip \
		--exclude=./$(NAME)/.git/* \
		--exclude=./$(NAME)/.github/* \
		--exclude=./$(NAME)/.scripts/* \
		--exclude=./$(NAME)/.gitattributes \
		--exclude=./$(NAME)/*.gitignore \
		--exclude=./$(NAME)/makefile \
		--exclude=./$(NAME)/cookiejar.txt \
		./$(NAME)

release:
	@bash ./.scripts/release.sh
