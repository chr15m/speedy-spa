all: build/index.html build/mithril.min.js

build:
	mkdir -p build

build/index.html: artifact.html build build/mithril.min.js
	html-minifier --minify-css --minify-js --collapse-whitespace < $< > $@

build/mithril.min.js:
	curl -s https://unpkg.com/mithril@1.1.5/mithril.min.js > build/mithril.min.js

main.js: main.wisp
	wisp --no-map < $< > $@

artifact.html: main.js index.template.html style.css
	gpp -Dtitle="Ok!" -H index.template.html > $@

.PHONY: clean

clean:
	rm -f artifact.html main.js build/*
