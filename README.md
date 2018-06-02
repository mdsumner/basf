
<!-- README.md is generated from README.Rmd. Please edit that file -->

# basf

The goal of basf is to plot simple features in a base graphics way.

This is for developers writing packages frustrated with the way sf
plots. It’s not for general use.

## Installation

``` r
devtools::install_github("mdsumner/basf")
#> Using GitHub PAT from envvar GITHUB_PAT
#> Downloading GitHub repo mdsumner/basf@master
#> from URL https://api.github.com/repos/mdsumner/basf/zipball/master
#> Installation failed: Not Found (404)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(basf)
#> Loading required package: sf
#> Linking to GEOS 3.6.2, GDAL 2.3.0, proj.4 4.9.3
## all the stuff is available
nc <- read_sf(system.file("shape/nc.shp", package="sf"))

## all we've changed is the plot command
plot(nc)
plot(nc[sample(1:nrow(nc), 10), ], col = rainbow(10), add = TRUE)
```

<img src="man/figures/README-example-1.png" width="100%" />

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
