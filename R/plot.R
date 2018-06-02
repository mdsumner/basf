#' Plot simple features simply
#'
#' Overrides 'sf::plot.sf' and wraps the call to 'plot(st_geometry(x))'.
#'
#' This can be used when developing code or checking things, so that plots
#' aren't always faceted by all attributes, coloured by them, or leaving
#' the plot unusable for subsequent additional drawing.
#' @param x sf object (the data.frame one)
#' @param ... arguments passed to [sf::plot_sfc]
#'
#' @return used for its side effects
#' @export
#'
#' @examples
#' nc <- read_sf(system.file("shape/nc.shp", package="sf"))
#' ## all we've changed is the plot command
#' plot(nc)
#' plot(nc[sample(1:nrow(nc), 10), ], col = rainbow(10), add = TRUE)
#' @importFrom graphics plot
#' @importFrom sf st_geometry
#' @importFrom tibble tibble
plot.sf <- function(x, ...) {
  plot(st_geometry(x), ...)
}
#
# plot.sfc <- function(x, ...) {
#   lapply(x, plot, ...)
# }
#
# na_bind <- function(x) {
#   head(do.call(rbind, lapply(x, function(y) rbind(y, NA))), -1L)
# }
# plot.MULTIPOLYGON <- function (x, y = NULL, border = NULL, col = NA, lty = par("lty"),
#                                    rule = "winding", ..., asp = NA){
#   xy <- as.data.frame(st_coordinates(x))
#   if (!is.null(y)) warning("second argument 'y' ignored")
#   plot(xy[,1:2], asp = asp, type = "n")
#   polypath(na_bind(split(xy[c("X", "Y")], paste(xy[["L1"]], xy[["L2"]]))),
#            border = border, col = col, lty = lty, rule = rule, ...)
# }
