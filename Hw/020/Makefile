
default:
	echo "No default target"

DIRS := 
CONSTANTS := Makefile README.md test_cases.m test.m trycatchquit.m wallwhine.m int_to_day.m
UNSAFES := day_to_int.m what_day.m
IGNORE :=
MADE :=

clean: clean-dotfiles clean-safe clean-grade clean-sandbox

include ../../globals.mk

include ../../safe.mk

MADE += $(SAFES)

#
# Sandbox
#

SANDBOX_SOURCES := $(wildcard *.m)
SANDBOX_TARGETS := diary

include ../../sandbox.mk

MADE += diary .diary .sandbox

#
# Grading
#

GRADES_MEAT := .grade.formatted_day_to_int .grade.formatted_what_day
GRADES_SILICON := .grade.sandbox .grade.diary

.grade.formatted_day_to_int: day_to_int.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Formatted?' MESSAGE='must be formatted'

.grade.formatted_what_day: what_day.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Formatted?' MESSAGE='must be formatted'

include ../../grade.mk
include ../dot-grade.mk

MADE += $(GRADES_MADE)

#
# Dotfiles
#

include ../../dotfiles.mk

