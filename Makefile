FILENAME=pinscape-build-guide
VERSION=v2.1.0

all: epub pdf html

epub:
	bundle exec asciidoctor-epub3 \
		book/main.adoc \
		-o dist/$(FILENAME)-$(VERSION).epub

pdf:
	bundle exec asciidoctor-pdf \
		book/main.adoc \
		-o dist/$(FILENAME)-$(VERSION).pdf
		
html:
	bundle exec asciidoctor -b html5 \
		book/main.adoc \
		-o dist/$(FILENAME)-$(VERSION).html; \
	cp -r book/images dist/

clean:
	rm -rf dist/*