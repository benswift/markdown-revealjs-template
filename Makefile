# the name of a css file in reveal.js/css/theme
slide-theme := anucs

# find all the .md source files
md := $(wildcard *.md)

all: slides

slides: $(md:.md=.html)

%.html: %.md revealjs-header.html
	pandoc -t revealjs --standalone --no-highlight --slide-level=2 --include-in-header=revealjs-header.html --variable=revealjs-url:reveal.js --variable=theme:$(slide-theme) -i "$(<F)" -o "$(@F)"

css:
	sass --no-cache reveal.js/css/theme/source/$(slide-theme).scss reveal.js/css/theme/$(slide-theme).css

clean:
	rm $(md:.md=.html)
