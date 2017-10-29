all: index.html mithril.min.js mui.min.css

mithril.min.js:
	curl -s https://unpkg.com/mithril@1.1.5/mithril.min.js > mithril.min.js

mui.min.css:
	curl -s https://cdn.muicss.com/mui-0.9.28/css/mui.min.css > mui.min.css

main.js: main.wisp
	wisp --no-map < $< > $@

artifact.html: main.js index.template.html style.css
	gpp -Dtitle="Ok!" -H index.template.html > $@

index.html: artifact.html mithril.min.js mui.min.css
	html-minifier --minify-css --minify-js --collapse-whitespace < $< > $@

clean:
	rm -f artifact.html main.js index.html mithril.min.js mui.min.css
