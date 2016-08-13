UGLIFYJS = node_modules/uglify-js/bin/uglifyjs

all: d3-parliament.min.js

d3-parliament.min.js: d3-parliament.js uglifyjs
	$(UGLIFYJS) $< -c -m -o $@

clean:
	rm -f d3-parliament.min.js

uglifyjs: $(UGLIFYJS)

$(UGLIFYJS):
	npm install uglify-js
