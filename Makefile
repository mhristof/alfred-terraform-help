#
#


TESTS := $(wildcard tests/*.bats)

terraform-help.alfredworkflow: info.plist tf-doc.py
	zip -r terraform-help.alfredworkflow info.plist
	zip -r terraform-help.alfredworkflow icon.png
	zip -r terraform-help.alfredworkflow tf-doc.py

open: terraform-help.alfredworkflow
	open terraform-help.alfredworkflow

info.plist: info.plist.template
	./generate.sh

test:
	bats $(TESTS)

all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
