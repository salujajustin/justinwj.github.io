# Simple Makefile to convert .org files to HTML

# Convert all .org files to HTML in public/ directory
all:
	@mkdir -p public/essays
	@for org in essays/*.org; do \
		if [ -f "$$org" ]; then \
			basename=$$(basename "$$org" .org); \
			html="public/essays/$$basename.html"; \
			echo "Converting $$org -> $$html"; \
			pandoc -f org -t html -s --css=../../style.css "$$org" -o "$$html"; \
			sed -i '' 's|<body>|<body>\
<div class="back-link"><a href="../../index.html">← Back to Justin Wayne Johnson</a></div>|' "$$html"; \
			sed -i '' 's|<hr />||g' "$$html"; \
		fi \
	done

# Clean generated HTML files
clean:
	@rm -rf public/

.PHONY: all clean