FILENAME=pinscape-build-guide
VERSION=v2.1.0
SOURCE_DIR=book
DEST_DIR=dist

all: epub pdf html

epub:
	bundle exec asciidoctor-epub3 \
		main.adoc \
                -B $(SOURCE_DIR) \
                -D $(DEST_DIR)/epub \
		-o $(FILENAME)-$(VERSION).epub; \
        rm $(DEST_DIR)/epub/*.css

pdf:
	bundle exec asciidoctor-pdf \
		main.adoc \
                -B $(SOURCE_DIR) \
                -D $(DEST_DIR)/pdf \
		-o $(FILENAME)-$(VERSION).pdf; \
        rm $(DEST_DIR)/pdf/*.css
		
html:
	bundle exec asciidoctor -v -b html5 \
		main.adoc \
                -B (SOURCE_DIR) \
                -D $(DEST_DIR)/html \
		-o $(FILENAME)-$(VERSION).html; \
	cp -r $(SOURCE_DIR)/images $(DEST_DIR)/html

clean:
	rm -rf dist/*
