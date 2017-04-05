# the name of a css file in scripts/reveal.js/css/theme
revealjs-url := scripts/reveal.js
revealjs-theme-path := $(revealjs-url)/css/theme
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
        --variable=theme:$(slide-theme) \
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

$(revealjs-theme-path)/$(slide-theme).css: $(revealjs-theme-path)/source/$(slide-theme).scss
	sass --no-cache $< $@

css: $(revealjs-theme-path)/$(slide-theme).css

watch:
	sass --no-cache --watch $(revealjs-theme-path)/source/$(slide-theme).scss\:$(revealjs-theme-path)/$(slide-theme).css

clean:
	rm $(md:.md=.html) $(revealjs-theme-path)/$(slide-theme).css
