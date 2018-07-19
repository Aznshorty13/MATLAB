
#
# DO NOT EDIT
#

SHELL := /bin/bash
HASHER := /usr/bin/sha256sum
PREFIX := 16f-math-2370
RELPATH := $(shell relpath $$(pwd) $$(git rev-parse --show-toplevel) )
GH_OWNER := bmccary
GH_REPO := $(shell basename $$(git rev-parse --show-toplevel) )
GH_USER := $(shell echo $(GH_REPO) | perl -p -e 's/$(PREFIX)-(.*)/\1/' )

pygmentize:
	echo ">>>>>>>>>>>"; \
	if [[ "$(suffix $(FNAME))" == ".m" ]]; \
	then \
		pygmentize -l matlab -O linenos=True $(FNAME); \
	else \
		pygmentize -g -O linenos=True $(FNAME); \
	fi; \
	echo "<<<<<<<<<<<";

