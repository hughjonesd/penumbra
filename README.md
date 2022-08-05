
<!-- README.md is generated from README.Rmd. Please edit that file -->

# penumbra

<!-- badges: start -->
<!-- badges: end -->

This is an R package based on Neal McKee’s [penumbra color
palette](https://github.com/nealmckee/penumbra/).

## Installation

You can install the development version of penumbra like so:

``` r
remotes::install_github("hughjonesd/penumbra")
```

## Example

``` r
library(penumbra)
## basic example code
palette(penumbra::color_pal(n = 7, contrast = "contrast+"))
plot(1:7, pch = 19, cex = 5, col = 1:7)
```

<img src="man/figures/README-example-1.png" width="100%" />
