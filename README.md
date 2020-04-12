
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/mdsumner/basf?branch=master&svg=true)](https://ci.appveyor.com/project/mdsumner/basf)

# basf

The goal of basf is to plot simple features in a base graphics way that
sp did.

## Installation

``` r
devtools::install_github("mdsumner/basf")
```

The idea is to use `library(basf)` instead of `library(sf)` and get on
with the job.

## Example

There will be a warning when basf starts up because this is what it
does.

``` r
Registered S3 method overwritten by 'basf':
  method  from
  plot.sf sf  
```

This is a basic example which shows the only impact of basf.

``` r
library(basf)

## all the stuff is available
x <- read_sf(system.file("shape/nc.shp", package="sf"))

## all we've changed is the plot command
plot(x)
plot(x[sample(1:nrow(x), 10), ], col = rainbow(10), add = TRUE)
## overplotting works
axis(1); axis(2)
abline(v = -80, h = -34)
```

<img src="man/figures/README-example-1.png" width="100%" />

Without basf, we would have to do extra format-aware workarounds when
setting up the plot. I find this incredibly disruptive, perhaps because
I’ve used R and sp for so long - I use plotting every day to verify my
work. It makes no sense to me to make things format-specific so I’m kind
of mystified as to why it’s gone this way.

``` r
library(sf)
x <- read_sf(system.file("shape/nc.shp", package="sf"))

plot(x[1], reset = FALSE, col = NA, main = "")
plot(x[sample(1:nrow(x), 10), ], col = rainbow(10), add = TRUE)
axis(1); axis(2)
abline(v = -80, h = -34)
```

-----

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/mdsumner/basf/blob/master/CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.
