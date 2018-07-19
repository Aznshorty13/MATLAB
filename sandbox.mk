
#
# DO NOT EDIT
#

SHELL := /bin/bash

.PHONY: sandbox-build sandbox-run sandbox-copy sandbox-clean sandbox

SANDBOX_BASH := /bin/bash --norc --noprofile

SANDBOX_USER := mat

SANDBOX_TMPDIR := $(shell mktemp -d --tmpdir 2370-sandbox.XXXXXXXXX)
SANDBOX_CWD := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SANDBOX_B := $(notdir $(SANDBOX_CWD))

sandbox-safes: $(SAFES)
	if [[ -z "$(SAFES)" ]]; \
	then \
		echo "SAFES is blank, this is probably an error."; \
		exit 1; \
	fi
	for i in $(SAFES); do sha256sum -c $$i || exit 1; done

sandbox-build: sandbox-safes
	rm -f $(SANDBOX_TARGETS)
	cp -R ../$(SANDBOX_B) $(SANDBOX_TMPDIR)
	cd $(SANDBOX_TMPDIR) && chmod -R go-rwx $(SANDBOX_B)
	setfacl -m u:$(SANDBOX_USER):rx $(SANDBOX_TMPDIR)
	setfacl -m u:$(SANDBOX_USER):rwx $(SANDBOX_TMPDIR)/$(SANDBOX_B)
	cd $(SANDBOX_TMPDIR)/$(SANDBOX_B); if [[ -n "$(SANDBOX_SOURCES)" ]]; then setfacl -m u:$(SANDBOX_USER):r $(SANDBOX_SOURCES); fi

sandbox-run: sandbox-build
	cd $(SANDBOX_TMPDIR)/$(SANDBOX_B); \
	sudo -u $(SANDBOX_USER) $(SANDBOX_BASH) -c "matlab -nosplash -nodesktop -r 'trycatchquit'"; \
	code=$$?; \
	if [[ "$$code" == "0" ]]; \
	then \
		if [[ -n "$(SANDBOX_TARGETS)" ]]; \
		then \
			cd $(SANDBOX_TMPDIR)/$(SANDBOX_B); \
			sudo -u $(SANDBOX_USER) $(SANDBOX_BASH) -c "setfacl -m u:bcm052000:r $(SANDBOX_TARGETS)" || exit 1; \
		fi \
	else \
		echo "#"; \
		echo "# Good luck, we're all counting on you!"; \
		echo "#"; \
		echo "# ghi open -u $(GH_USER) -L '$(RELPATH)/sandbox' -m \"$(RELPATH)/test.m failed, please fix\" -- $(GH_OWNER)/$(GH_REPO)"; \
		echo "# ghi edit n -- $(GH_OWNER)/$(GH_REPO)"; \
		echo "# ghi comment n -- $(GH_OWNER)/$(GH_REPO)"; \
		echo "#"; \
		echo "#"; \
		ghi --no-pager list -- $(GH_OWNER)/$(GH_REPO); \
		env PROMPT_POSTFIX="(shirley) " bash; \
		exit 1; \
	fi

sandbox-copy: sandbox-run
	if [[ -n "$(SANDBOX_TARGETS)" ]]; \
	then \
		cd $(SANDBOX_TMPDIR)/$(SANDBOX_B); \
		cp $(SANDBOX_TARGETS) $(SANDBOX_CWD); \
	fi

sandbox-clean:
	rm -rf $(SANDBOX_TMPDIR)

sandbox-toplevel: sandbox-build sandbox-run sandbox-copy sandbox-clean

sandbox: .sandbox

.sandbox: $(SANDBOX_SOURCES) $(SAFES)
	if sha256sum -c $@; \
	then \
		touch $@; \
	else \
		if $(MAKE) -B -k sandbox-toplevel; \
		then \
			sha256sum --tag $+ > $@; \
		else \
			echo meow > $@; \
		fi \
	fi
	
clean-sandbox:
	rm -f .sandbox $(SANDBOX_TARGETS)

