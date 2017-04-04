# the name of a css file in reveal.js/css/theme
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
        --variable=revealjs-url:reveal.js \
        --variable=theme:$(slide-theme) \
        --variable=controls:false \
        --variable=transition:fade \
        --variable=viewDistance:10 \
        --variable=center:false \
        --variable=width:\"100%\" \
        --variable=height:\"100%\" \
        --variable=margin:0 \
        --variable=minScale:1 \
        --variable=maxScale:1 \
        -i "$(<F)" -o "$(@F)"

reveal.js/css/theme/$(slide-theme).css: reveal.js/css/theme/source/$(slide-theme).scss
	sass --no-cache $< $@

css: reveal.js/css/theme/$(slide-theme).css

watch:
	sass --no-cache --watch reveal.js/css/theme/source/$(slide-theme).scss\:reveal.js/css/theme/$(slide-theme).css

clean:
	rm $(md:.md=.html)
	rm reveal.js/css/theme/$(slide-theme).css
