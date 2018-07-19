
#
# DO NOT EDIT
#

.PHONY: grade grade-here grade-push grade-pop clean-grade

GRADES_HERE := $(GRADES_MEAT) $(GRADES_SILICON) 
GRADES_MADE := $(GRADES_HERE) .grade

grade-here: sandbox $(GRADES_MADE)

grade: grade-push grade-here grade-pop

grade-push:
	for i in $(DIRS); do $(MAKE) -C $$i grade; done

grade-pop: grade-here
	
clean-grade-here: clean-grade-silicon-here clean-grade-meat-here
	rm -f .grade

clean-grade-silicon-here:
	rm -f $(GRADES_SILICON)

clean-grade-meat-here:
	for i in $(GRADES_MEAT); do if [[ -f $$i ]]; then rm -i $$i; fi done

clean-grade-silicon: clean-grade-silicon-here
	for i in $(DIRS); do $(MAKE) -C $$i $@; done

clean-grade: clean-grade-here
	for i in $(DIRS); do $(MAKE) -C $$i $@; done

clean-grade-meat: clean-grade-meat-here
	for i in $(DIRS); do $(MAKE) -C $$i $@; done

.grade.diary: $(SAFES) $(UNSAFES) .grade.sandbox diary
	if sha256sum -c .grade.sandbox; \
	then \
		if cmp diary $(KEY)/$(RELPATH)/diary; \
		then \
			sha256sum --tag $+ > $@; \
		else \
			grep WARNING diary; \
			echo "#"; \
			echo "# Good luck, we're all counting on you!"; \
			echo "#"; \
			echo "# ghi open -u $(GH_USER) -L '$(RELPATH)/diary' -m \"$(RELPATH) diary output\" -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "# ghi edit n -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "# ghi comment n -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "#"; \
			echo "#"; \
			ghi --no-pager list -- $(GH_OWNER)/$(GH_REPO); \
			env PROMPT_POSTFIX="(shirley) " bash; \
			echo meow > $@; \
		fi; \
	else \
		echo meow > $@; \
	fi

diary: .grade.sandbox

.grade.sandbox: .sandbox
	if sha256sum -c $<; \
	then \
		sha256sum --tag $< > $@; \
	else \
		echo meow > $@; \
	fi

.PHONY: pygmentize dot-grade-dot-tag

dot-grade-dot-tag:
	if sha256sum -c .grade$(TAG); \
	then \
		touch .grade$(TAG); \
	else \
		$(MAKE) -B pygmentize FNAME=$(FNAME); \
		while true; \
		do \
			read -p "$(PROMPT) (y/n): " x; \
			[[ "$$x" == "y" ]] && break; \
			[[ "$$x" == "n" ]] && break; \
		done; \
		echo ""; \
		if [[ "$$x" == "y" ]]; \
		then \
			sha256sum --tag $(FNAME) > .grade$(TAG); \
		else \
			echo "#"; \
			echo "# Good luck, we're all counting on you!"; \
			echo "#"; \
			echo "# ghi open -u $(GH_USER) -L '$(RELPATH)/$(FNAME)' -m '$(RELPATH)/$(FNAME) $(MESSAGE)' -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "# ghi edit n -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "# ghi comment n -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "#"; \
			ghi --no-pager list -- $(GH_OWNER)/$(GH_REPO); \
			env PROMPT_POSTFIX="(shirley) " bash; \
			echo meow > .grade$(TAG); \
		fi \
	fi

