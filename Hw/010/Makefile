
.PHONY: default clean debug

default:
	echo "No default target"

DIRS := 
CONSTANTS := Makefile README.md test_cases.m test.m trycatchquit.m wallwhine.m oracle.m
UNSAFES := play.m
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

GRADES_MEAT := .grade.formatted .grade.recursive 
GRADES_SILICON := .grade.sandbox .grade.diary

.grade.formatted: play.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Formatted?' MESSAGE='must be formatted'

.grade.recursive: play.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Recursive?' MESSAGE='must be recursive'

include ../../grade.mk
include ../dot-grade.mk

MADE += $(GRADES_MADE)

#
# Dotfiles
#

include ../../dotfiles.mk

