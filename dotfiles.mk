
#
# DO NOT EDIT
#

DOTFILES := .constants .dirs .unsafes .made .ignore
DOTFILES_ACCUM := $(DOTFILES:%=%.accum)
DOTFILES_TAG := .constants.tag
DOTFILES_MADE := $(DOTFILES) $(DOTFILES_ACCUM) $(DOTFILES_TAG) 

MADE += $(DOTFILES_MADE)

.PHONY: dotfiles dotfiles-here dotfiles-push dotfiles-pop clean-dotfiles

dotfiles: dotfiles-here dotfiles-push dotfiles-pop $(DOTFILES_MADE)

dotfiles-here: $(DOTFILES)
	for i in $$(cat $+ | sort | uniq -d); \
	do \
		echo "Duplicates in $+:"; \
		cat $+ | sort | uniq -d; \
		exit 1; \
	done

dotfiles-push: dotfiles-here
	for i in $(DIRS); do $(MAKE) -C $$i dotfiles || exit 1; done

dotfiles-pop: dotfiles-push 

.%.accum: .% dotfiles-pop
	( \
		for i in $(DIRS); do for j in $$(< $$i/$@); do echo $$i/$$j; done; done; \
		cat $<; \
	) | sort > $@

.%.tag: .%.accum dotfiles-pop
	if [[ -s "$<" ]]; \
	then \
		sha256sum --tag $$(< $<); \
	else \
		echo ""; \
	fi > $@

clean-dotfiles:
	rm -f $(DOTFILES_MADE)

clean-dotfiles-recursive: clean-dotfiles
	for i in $(DIRS); do $(MAKE) -C $$i $@; done

.constants: $(MAKEFILES)
	for i in $(CONSTANTS); do echo $$i; done | sort > $@
	for i in $$(uniq -d < $@); do echo "Duplicate entries in $@:"; uniq -d $@; exit 1; done

.dirs: $(MAKEFILES)
	for i in $(DIRS); do echo $$i; done | sort > $@
	for i in $$(uniq -d < $@); do echo "Duplicate entries in $@:\n\n\n"; uniq -d $@; exit 1; done

.unsafes: $(MAKEFILES)
	for i in $(UNSAFES); do echo $$i; done | sort > $@
	for i in $$(uniq -d < $@); do echo "Duplicate entries in $@:\n\n\n"; uniq -d $@; exit 1; done

.made: $(MAKEFILES)
	for i in $(MADE); do echo $$i; done | sort > $@
	for i in $$(uniq -d < $@); do echo "Duplicate entries in $@:\n\n\n"; uniq -d $@; exit 1; done

.ignore: $(MAKEFILES)
	for i in $(IGNORE); do echo $$i; done | sort > $@
	for i in $$(uniq -d < $@); do echo "Duplicate entries in $@:\n\n\n"; uniq -d $@; exit 1; done

dotfiles-check-ls: dotfiles-check-ls-push

dotfiles-check-ls-here:
	meow=0; \
	for i in $$(ls -a); \
	do \
		[[ "$$i" == "." ]] && continue; \
		[[ "$$i" == ".." ]] && continue; \
		[[ "$$i" == ".git" ]] && continue; \
		if [[ -d "$$i" ]]; \
		then \
			egrep "^$$i\$$" .dirs > /dev/null && continue; \
			egrep "^$$i\$$" .ignore > /dev/null && continue; \
			echo "Unknown directory: $$i"; \
			exit 1; \
		else \
			egrep "^$$i\$$" .constants > /dev/null && continue; \
			egrep "^$$i\$$" .unsafes > /dev/null && continue; \
			egrep "^$$i\$$" .made > /dev/null && continue; \
			egrep "^$$i\$$" .ignore > /dev/null && continue; \
			echo ""; \
			echo ""; \
			echo "Unknown file: $$i"; \
			echo ""; \
			echo "#"; \
			echo "# ghi open -u $(GH_USER) -L 'unknown-file' -m \"$(RELPATH)/$$i does not belong, please delete\" -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "# ghi edit n -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "# ghi comment n -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "#"; \
			echo ""; \
			ghi --no-pager list -- $(GH_OWNER)/$(GH_REPO); \
			env PROMPT_POSTFIX="(shirley) " bash; \
			meow=1; \
		fi; \
	done; \
	if [[ "$$meow" == "1" ]]; \
	then \
		exit 1; \
	fi

dotfiles-check-ls-push: dotfiles-check-ls-here
	for i in $(DIRS); do $(MAKE) -C $$i dotfiles-check-ls || exit 1; done

dotfiles-check-tag:
	if sha256sum -c $(KEY)/$(RELPATH)/.constants.tag > /dev/null; \
	then \
		true; \
	else \
		sha256sum -c $(KEY)/$(RELPATH)/.constants.tag | grep FAILED | \
		while IFS='' read -r i || [[ -n "$$i" ]]; \
		do \
			j=$$(echo $$i | cut -d ':' -f 1); \
			echo ""; \
			echo "#"; \
			echo "# Constant file modified: $$j"; \
			echo "#"; \
			echo "# ghi open -u $(GH_USER) -L 'constant-edit' -m \"$$j may not be edited\" -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "# ghi edit n -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "# ghi comment n -- $(GH_OWNER)/$(GH_REPO)"; \
			echo "# cp $(KEY)/$$j $$j; git add $$j; git commit; git push"; \
			echo "#"; \
			echo ""; \
		done; \
		ghi --no-pager list -- $(GH_OWNER)/$(GH_REPO); \
		env PROMPT_POSTFIX="(shirley) " bash; \
		exit 1; \
	fi

