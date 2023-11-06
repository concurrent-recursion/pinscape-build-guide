FILENAME=pinscape-build-guide
VERSION=v2.1.0
SOURCE_DIR=book
DEST_DIR=dist

all: epub pdf html

epub:
	bundle exec asciidoctor-epub3 \
		$(SOURCE_DIR)/main.adoc \
		-D $(DEST_DIR)/epub \
		-o $(FILENAME)-$(VERSION).epub \
        && rm $(DEST_DIR)/epub/asciidoctor.css

pdf:
	bundle exec asciidoctor-pdf \
		$(SOURCE_DIR)/main.adoc \
		-D $(DEST_DIR)/pdf \
		-o $(FILENAME)-$(VERSION).pdf \
		&& rm $(DEST_DIR)/pdf/asciidoctor.css
html:
	bundle exec asciidoctor -v -b html5 \
		-r asciidoctor-lazy-images \
		$(SOURCE_DIR)/main.adoc \
                -D $(DEST_DIR)/html \
		-o index.html \
	&& cp -r $(SOURCE_DIR)/images $(DEST_DIR)/html \
	&& gzip -k $(DEST_DIR)/html/index.html

clean:
	rm -rf dist/*
