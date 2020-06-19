# Makefile

NAME = $(shell jq .name info.json -r)
VERSION = $(shell jq .version info.json -r)

help:
	@echo "Available Commands"
	@echo "\tmake build"
	@echo "\tmake release"

.DEFAULT_GOAL := help

build:
	mkdir -p $(NAME)_$(VERSION)
	mkdir -p $(NAME)_$(VERSION)/$(NAME)

	cp -r locale $(NAME)_$(VERSION)/$(NAME)
	cp -r resources $(NAME)_$(VERSION)/$(NAME)
	cp -r changelog.txt $(NAME)_$(VERSION)/$(NAME)
	cp -r info.json $(NAME)_$(VERSION)/$(NAME)
	cp -r LICENSE $(NAME)_$(VERSION)/$(NAME)
	cp -r *.lua $(NAME)_$(VERSION)/$(NAME)

	rm -rf $(NAME)_$(VERSION).zip || true
	cd $(NAME)_$(VERSION) && zip -r ../$(NAME)_$(VERSION).zip $(NAME)

	rm -rf $(NAME)_$(VERSION)

release:
	@bash ./.scripts/release.sh
