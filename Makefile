# the name of a css file in reveal.js/css/theme
slide-theme := anucs

# trailing slash is necessary
dest-folder := slides/

# find all the .md source files
md := $(wildcard *.md)

all: slides

slides: $(md:.md=.html)

%.html: %.md revealjs-header.html
	cd "$(@D)" && pandoc -t revealjs --standalone --no-highlight --slide-level=2 --include-in-header=revealjs-header.html --variable=revealjs-url:reveal.js --variable=theme:$(slide-theme) -i "$(<F)" -o "$(@F)"

clean:
	rm $(md:.md=.html)

# process the ANU sass (paths hardcoded at present)
css:
	sass --no-cache reveal.js/css/theme/source/anucs.scss reveal.js/css/theme/anucs.css
