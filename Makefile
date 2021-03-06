PREFIX ?= ~

.PHONY: all install byte-compile

all: install byte-compile

install:
	install -dm755 $(PREFIX)/.emacs.d/conf/ && \
	install -m0644 .emacs.d/conf/*.el $(PREFIX)/.emacs.d/conf/ && \
	install -m0644 .emacs $(PREFIX)/.emacs

byte-compile:
	rm -f $(PREFIX)/.emacs.d/conf/*.elc
	emacs -batch -l $(PREFIX)/.emacs -f batch-byte-compile $(PREFIX)/.emacs.d/conf/*.el

.NOTPARALLEL:
