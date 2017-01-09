---
output:
  md_document:
    variant: markdown_github
---



# Create a Chord Diagram

The `chordViz` package, based on the `chorddiag` package (http://github.com/mattflor/chorddiag) and
the viz.js D3 library (http://github.com/NPashaP/Viz), is an R htmlwidget that allows the user to create
interactive chord diagrams that emphasize the clarity of directed relationships
between groups on hover/mouseover.


```r
# Install and load package.
devtools::install_github("nredell/chordViz")
## Downloading GitHub repo nredell/chordViz@master
## from URL https://api.github.com/repos/nredell/chordViz/zipball/master
## Installing chordViz
## "C:/PROGRA~1/R/R-33~1.1/bin/x64/R" --no-site-file --no-environ --no-save  \
##   --no-restore --quiet CMD INSTALL  \
##   "C:/Users/nredell/AppData/Local/Temp/Rtmp0aK82c/devtoolsa042263331a/nredell-chordViz-5c1006a"  \
##   --library="C:/Users/nredell/Documents/R/win-library/3.3"  \
##   --install-tests
## 
## Reloading installed chordViz
library(chordViz)

# Create an input matrix with random data.
set.seed(224)
m <- matrix(trunc(runif(100, 1, 20)), nrow = 10)

# Create the chord diagram.
chordViz(m, start = 3/2, groupNames = LETTERS[1:ncol(m)])
## Error in loadNamespace(name): there is no package called 'webshot'
```

## Chord Diagram from chordViz()

![Chord Diagram](images/chordViz_1.png)

## Chord Diagram Hovering Over Group 'A'

![Chord Diagram Hovering Over Group 'A'](images/chordViz_2.png)
