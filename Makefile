.PHONY: all
all:
	perl -0777 -pe 's,/\*!START_DEBUG.*?END_DEBUG\*/,,gs' LAB.src.js > LAB-no-debug.js
	head -4 LAB.src.js > LAB.min.js
	head -4 LAB.src.js > LAB-debug.min.js
	uglifyjs --mangle <LAB-no-debug.js >>LAB.min.js
	uglifyjs --mangle <LAB.src.js >>LAB-debug.min.js
	cp LAB.min.js LAB.js
	rm LAB-no-debug.js
