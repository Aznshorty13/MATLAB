
#
# DO NOT EDIT
#

.PHONY: safe safe-here safe-push safe-pop clean-safe

SAFES := $(UNSAFES:%=.safe.%)

safe: safe-here safe-push safe-pop

safe-here: $(SAFES)

safe-push: safe-here
	for i in $(DIRS); do $(MAKE) -C $$i safe; done

safe-pop: safe-push

WARY := eval feval ! builtin dos unix fopen fwrite ftp delete printf fclose system

.safe.%: %
	if sha256sum -c $@; \
	then \
		touch $@; \
		exit 0; \
	fi; \
	$(MAKE) -B pygmentize FNAME=$<; \
	while true; \
	do \
		read -p "Safe? (y/n): " x; \
		[[ "$$x" == "y" ]] && break; \
		[[ "$$x" == "n" ]] && break; \
	done; \
	echo ""; \
	if [[ "$$x" == "y" ]]; \
	then \
		meow=""; \
		for w in $(WARY); \
		do \
			if grep $$w $<; \
			then \
				while true; \
				do \
					read -p "Safe? (y/n): " x; \
					[[ "$$x" == "y" ]] && break; \
					[[ "$$x" == "n" ]] && break; \
				done; \
				if [[ "$$x" == "n" ]]; \
				then \
					meow="purr"; \
					break; \
				fi \
			fi \
		done; \
		if [[ -z "$$meow" ]]; \
		then \
			sha256sum --tag $< > $@; \
			exit 0; \
		fi; \
	fi; \
	echo "#"; \
	echo "# Good luck, we're all counting on you!"; \
	echo "#"; \
	echo "# ghi open -u $(GH_USER) -L '$(RELPATH)/$<' -m '$(RELPATH)/$< unsafe' -- $(GH_OWNER)/$(GH_REPO)"; \
	echo "# ghi edit n -- $(GH_OWNER)/$(GH_REPO)"; \
	echo "# ghi comment n -- $(GH_OWNER)/$(GH_REPO)"; \
	echo "#"; \
	echo "#"; \
	ghi --no-pager list -L '$(RELPATH)/$<' -- $(GH_OWNER)/$(GH_REPO); \
	env PROMPT_POSTFIX="(shirley) " bash; \
	echo meow > $@;

clean-safe:
	for i in $(SAFES); do if [[ -f $$i ]]; then rm -i $$i; fi done

