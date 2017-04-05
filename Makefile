# the name of a css file in scripts/reveal.js/css/theme
revealjs-url := scripts/reveal.js-3.4.1
slide-theme := anucs

# find all the .md source files
md := $(wildcard *.md)

all: slides css

slides: $(md:.md=.html)

%.html: %.md revealjs-header.html
	pandoc -t revealjs \
				--standalone \
	      --no-highlight \
        --slide-level=2 \
        --include-in-header=revealjs-header.html \
        --variable=revealjs-url:$(revealjs-url) \
        --variable=theme:none \
        --variable=controls:false \
        --variable=transition:fade \
        --variable=viewDistance:10 \
        --variable=center:false \
        --variable=width:\"90%\" \
        --variable=height:\"100%\" \
        --variable=margin:0 \
        --variable=minScale:1 \
        --variable=maxScale:1 \
        -i "$(<F)" -o "$(@F)"

styles/$(slide-theme).css: styles/$(slide-theme).scss
	sass --no-cache $< $@

css: styles/$(slide-theme).css

watch:
	sass --no-cache --watch styles/$(slide-theme).scss\:styles/$(slide-theme).css

clean:
	rm $(md:.md=.html) styles/$(slide-theme).css
