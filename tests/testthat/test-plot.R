disp_spat <- function() {
  x <- read_sf(system.file("shape/nc.shp", package="sf"))
  plot(x)
  axis(1)
  abline(v = -80)
}

test_that("multiplication works", {
  testthat::skip_if_not_installed("vdiffr")
  vdiffr::expect_doppelganger(
"disp_spat", disp_spat()
  )
})

test_that("tibble is tibble", {
  expect_s3_class(dummy_internal(), "tbl_df")
})
