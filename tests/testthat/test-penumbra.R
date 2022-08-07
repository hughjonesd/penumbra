test_that("Palettes work", {
  for (contrast in c("balanced", "contrast+", "contrast++")) {
    for (n in 2:8) {
      expect_silent(
        palette(color_pal(n = n, contrast = contrast))
      )
      expect_silent(
        palette(base_pal(n = n, contrast = contrast))
      )
    }
    expect_silent(
      base_pal(n = 9, contrast = contrast)
    )

    expect_error(
      color_pal(n = 9, contrast = contrast)
    )
    expect_error(
      color_pal(n = 1, contrast = contrast)
    )
    expect_error(
      base_pal(n = 1, contrast = contrast)
    )
  }
})
