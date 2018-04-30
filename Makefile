#
#


terraform-help.alfredworkflow: info.plist
	zip -r terraform-help.alfredworkflow info.plist
	zip -r terraform-help.alfredworkflow icon.png

info.plist: info.plist.template tf-doc.py
	./generate.sh

all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
