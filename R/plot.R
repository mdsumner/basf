#' Plot simple features simply
#'
#' Overrides `sf::plot.sf` and wraps the call to `plot(st_geometry(x))`. When
#' working with spatial data it's often useful to create maps where we
#' overlay spatially coincident data in a plot.
#'
#' This is used so that plots aren't always facetted by all attributes, coloured
#' by them, or leaving the plot unusable for subsequent additional drawing. The
#' key feature is that we don't have to change our behaviour and good habits
#' depending on the format in use.
#'
#' @param x sf object (the data.frame one)
#' @param ... arguments passed to [sf::plot_sfc]
#'
#' @return used for its side effects of creating a plot
#' @export
#'
#' @examples
#' x <- read_sf(system.file("shape/nc.shp", package="sf"))
#' ## all we've changed is the plot command
#' plot(x)
#' ## we can overplot without format-specific acrobatics
#' plot(x[sample(1:nrow(x), 10), ], col = rainbow(10), add = TRUE)
#' abline(v = 34); axis(2)
#' @importFrom graphics plot
#' @importFrom sf st_geometry
plot.sf <- function(x, ...) {
 plot(sf::st_geometry(x), ...)
}

# just for read_sf
#' @importFrom tibble tibble
dummy_internal <- function() {
  tibble::tibble()
}

