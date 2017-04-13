<!--
 !-- Copyright (C) 2017  Ben Swift
 !--
 !-- Permission is hereby granted, free of charge, to any person obtaining a copy
 !-- of this software and associated documentation files (the "Software"), to deal
 !-- in the Software without restriction, including without limitation the rights
 !-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 !-- copies of the Software, and to permit persons to whom the Software is
 !-- furnished to do so, subject to the following conditions:
 !-- The above copyright notice and this permission notice shall be included in
 !-- all copies or substantial portions of the Software.
 !--
 !-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 !-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 !-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 !-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 !-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 !-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 !-- THE SOFTWARE.
  -->

# Title {.center}

## Here's a slide

With some stuff.

- bullet one
- bullet two

## Fullscreen images {data-background-image="images/adriel-kloppenburg-14828.jpg"}

## Source code

Syntax highlighting courtesy of [`highlight.js`](https://highlightjs.org/)

```scheme
(println "here's the thing")
```

```c
int main(void){
  printf("foo bar.\n");
}
```

## Plots (it's just HTML+js)

<div id="tester" style="width=90vw; height=50vh;"></div>

<script src="./scripts/plotly-latest.min.js"></script>
<script>
TESTER = document.getElementById('tester');

Plotly.plot( TESTER, [{
    x: [1, 2, 3, 4, 5],
    y: [1, 2, 4, 8, 16] }], { 
    margin: { t: 0 } } );
</script>

## For more info

Check it out on GitHub:

<https://github.com/benswift/markdown-revealjs-template>


