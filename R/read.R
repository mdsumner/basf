#' Read GDAL vector data
#'
#' Read vector shape data with optional extent filter.
#'
#' The extent coordinates must be in the same projection as the source, or the result could be wrong.
#'
#' Uses the 'sf' package to pass the extent down to GDAL's ExecuteSQL as WKT, use anything with
#' an extent that the 'raster' package understands.
#'
#' @param x used as `sf::st_read()`` dsn argument
#' @param ext optional extent (as per raster package)
#' @param ... arguments passed to `sf::st_read()`
#'
#' @return sf object, see `sf::st_read()`
#' @export
#'
#' @examples
#' \dontrun{
#' \donttest{
#' # read_ext("myshapefile", raster::extent(100, 120, -40, -30))
#' }
#' }
read_ext <- function(x, ext = NULL, ...) {
  args <- list(...)
  args$dsn <- x
  args$stringsAsFactors <- FALSE
  if (!is.null(ext) && "wkt_filter" %in% names(args)) {
    message("wkt_filter argument ignored by 'read_ext' when 'ext' given")
  }

  if (!is.null(ext)) {
    if (!inherits(ext, "bbox")) {
      ext <- sf::st_bbox(raster::extent(ext))
    }
    args$wkt_filter <- sf::st_as_text(sf::st_as_sfc(ext))
  }
  do.call(sf::st_read, args)
}


