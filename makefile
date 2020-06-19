# Makefile
NAME = a2x1_config_bits
TAG := v0.0.0
# TAG := $(shell git rev-parse --abbrev-ref HEAD | tr -d '\040\011\012\015\n')
BRANCH := $(shell git rev-parse --abbrev-ref HEAD | tr -d '\040\011\012\015\n')
REVISION := $(shell git rev-parse HEAD)
TIMESTAMP := $(shell date --utc +%s)

help:
	@echo "Available Commands"
	@echo "\tmake build"

.DEFAULT_GOAL := help

build:
	zip -r $(NAME)-$(TAG).zip . --exclude=./*.zip --exclude=./.git/* --exclude=./.github/* --exclude=./makefile --exclude=./*.gitignore --exclude=./.gitattributes
