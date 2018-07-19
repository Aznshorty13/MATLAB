
default:
	echo "No default target"

DIRS := 
CONSTANTS := Makefile README.md
UNSAFES := run.m
IGNORES :=
MADE := diary .diary

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

GRADES_MEAT := .grade.uncommented
GRADES_SILICON := 

.grade.uncommented: run.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Uncommented?' MESSAGE='must be uncommented'

include ../../grade.mk
include ../dot-grade.mk

MADE += $(GRADES_MADE)

#
# Dotfiles
#

include ../../dotfiles.mk

