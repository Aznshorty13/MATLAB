
.grade: $(DIRS:%=%/.grade)
	@echo $@: $+
	for i in $(DIRS); \
	do \
		while IFS='' read -r j || [[ -n "$$j" ]]; \
		do \
			echo $$i/$$j; \
		done < "$$i/$@"; \
	done > $@

