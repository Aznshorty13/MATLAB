
#
# DO NOT EDIT
#

default:
	@echo "No default targets."

include globals.mk
include safe.mk

DIRS := hw
CONSTANTS := Makefile $(wildcard *.mk) .gitignore README.md
UNSAFES :=
IGNORE :=

include dot-grade.mk
include grade.mk

MADE := $(DOTFILES_MADE) $(GRADES_MADE) $(UNSAFES:%=.safe.%) constants.zip

include dotfiles.mk

sandbox:

clean-sandbox:

clean: clean-dotfiles clean-safe
	for i in $(DIRS); do $(MAKE) -C $$i clean; done

constants.zip: .constants.accum
	zip $@ $$(< $<)

walk: walk-1 walk-2 walk-3 walk-4 walk-5

walk-1: dotfiles-check-tag

walk-2: walk-1 clean-dotfiles-recursive

walk-3: walk-2 dotfiles

walk-4: walk-3 dotfiles-check-ls

walk-5: walk-4
	$(MAKE) grade KEY=$(KEY)

pull:
	hub pull

merge: pull
	hub fetch upstream
	hub merge upstream/master -m 'upstream merge'
	hub push

