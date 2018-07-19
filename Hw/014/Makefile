
default:
	echo "No default target"

DIRS := 
CONSTANTS := Makefile README.md test_cases.m test.m trycatchquit.m wallwhine.m factorial_iterative.m factorial_recursive.m
UNSAFES := gauss_formula.m gauss_iterative.m gauss_recursive.m
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

GRADES_MEAT := .grade.formula_formatted .grade.iterative_formatted .grade.recursive_formatted \
				.grade.formula .grade.iterative .grade.recursive 
GRADES_SILICON := .grade.sandbox .grade.diary

.grade.formula_formatted: gauss_formula.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Formatted?' MESSAGE='must be formatted'

.grade.iterative_formatted: gauss_iterative.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Formatted?' MESSAGE='must be formatted'

.grade.recursive_formatted: gauss_recursive.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Formatted?' MESSAGE='must be formatted'

.grade.formula: gauss_formula.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Formula n*(n + 1)/2 ?' MESSAGE='must use Gauss formula n*(n + 1)/2'

.grade.iterative: gauss_iterative.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Iterative?' MESSAGE='must be iterative'

.grade.recursive: gauss_recursive.m
	$(MAKE) -B dot-grade-dot-tag FNAME=$< TAG=$(suffix $@) PROMPT='Recursive?' MESSAGE='must be recursive'

include ../../grade.mk
include ../dot-grade.mk

MADE += $(GRADES_MADE)

#
# Dotfiles
#

include ../../dotfiles.mk

