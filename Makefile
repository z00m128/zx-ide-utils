ISONAME=zx-ide-utils-$(shell date +%F)
SOURCES=$(wildcard *.a80)
FILES=$(SOURCES:%.a80=%.tap)
DOCS=AUTHORS.md BUGS.md ChangeLog.md INSTALL.md LICENSE.md Makefile README.md TODO.md #infoexamples
DEST=..

all: $(ISONAME).iso .cvsignore

dron: DEFINES+=-D DRON_PORTS

dron: $(ISONAME).iso .cvsignore

$(ISONAME).iso: $(FILES)
	genisoimage -input-charset utf-8 -U -V "$(ISONAME)" -o "$(ISONAME).iso" $(FILES)

.cvsignore:
	echo '.cvsignore *.bin *.p *.err *.lst *.tap *.iso' >.cvsignore

$(FILES): START=$(shell grep "[^\.]org" $<|cut -f 4)

$(FILES): CLEAR=$(shell expr $(START) - 1)

$(FILES): %.tap: %.a80
	asl $< -o $(@:%.tap=%).p -L -u $(DEFINES)
	p2bin $(@:%.tap=%).p -l 0 -r \$$-\$$
	bin2tap -o $(@) -a $(START) -b -c $(CLEAR) -r $(START) $(@:%.tap=%).bin
	
clean:
	rm -f *.bin *.p *.err *.lst *.tap *.iso .cvsignore

distrib: $(ISONAME).iso
	rm -rf $(DEST)/$(ISONAME)
	mkdir $(DEST)/$(ISONAME)
	cp $(DOCS) $(SOURCES) $(FILES) $(ISONAME).iso $(DEST)/$(ISONAME)
	cd $(DEST); tar zcvf $(ISONAME).tar.gz $(ISONAME)
