# Makefile to install aps105 tools

.PHONY: all install uninstall

XDG_DATA_HOME ?= $(HOME)/.local/share
XDG_BIN_HOME ?= $(HOME)/.local/bin
DATA := $(XDG_DATA_HOME)/aps105
BIN := $(XDG_BIN_HOME)

all:
	@echo "run \"make install\" to install"
	@echo "run \"make uninstall\" to uninstall"

install:
	@mkdir -p $(DATA)
	@cp aps105.mk $(DATA)/aps105.mk
	@cp c.template $(DATA)/c.template
	@mkdir -p $(BIN)
	@cp labnew $(BIN)/labnew
	@cp labmake $(BIN)/labmake
	@chmod +x $(BIN)/labnew
	@chmod +x $(BIN)/labmake

uninstall:
	@rm -f $(DATA)/aps105.mk
	@rm -f $(DATA)/c.template
	@rmdir $(DATA) 2>/dev/null || true
	@rm -f $(BIN)/labnew
	@rm -f $(BIN)/labmake
