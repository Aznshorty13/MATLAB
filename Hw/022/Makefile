
default:
	echo "No default target"

DIRS := 
CONSTANTS := Makefile README.md test_cases.m test.m trycatchquit.m wallwhine.m divmod_key.p .gitignore
UNSAFES := divmod.m
IGNORE := divmod_key.m
MADE :=

clean: clean-dotfiles clean-safe clean-grade clean-sandbox

include ../../globals.mk

include ../../safe.mk

MADE += $(SAFES)

#
# Sandbox
#

SANDBOX_SOURCES := $(wildcard *.m) divmod_key.p
SANDBOX_TARGETS := diary

include ../../sandbox.mk

MADE += diary .diary .sandbox

#
# Grading
#

GRADES_MEAT := .grade.formatted .grade.subtraction
GRADES_SILICON := .grade.sandbox .grade.diary

.grade.formatted: divmod.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Formatted?' MESSAGE='must be formatted'

.grade.subtraction: divmod.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Repeated subtraction?' MESSAGE='must use repeated subtraction'

include ../../grade.mk
include ../dot-grade.mk

MADE += $(GRADES_MADE)

#
# Dotfiles
#

include ../../dotfiles.mk

