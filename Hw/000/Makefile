
default:
	echo "No default target"

DIRS := 
CONSTANTS := Makefile
UNSAFES := README.md 
IGNORE :=
MADE := 

clean: clean-dotfiles clean-safe clean-grade clean-sandbox

include ../../globals.mk

include ../../safe.mk

MADE += $(SAFES)

#
# Sandbox
#

sandbox:

clean-sandbox:

#
# Grading
#

GRADES_MEAT := .grade.edited
GRADES_SILICON := 

.grade.edited: README.md
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Edited?' MESSAGE='must be edited'

include ../../grade.mk
include ../dot-grade.mk

MADE += $(GRADES_MADE)

#
# Dotfiles
#

include ../../dotfiles.mk

