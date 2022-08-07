
#' Return colors from the Penumbra palette
#'
#' @param n Number of colors. Between 2 and 8 for `color_pal()`, between
#'   2 and 9 for `base_pal()`.
#' @param contrast One of `"balanced"`, `"contrast+"` or `"contrast++"`.
#'
#' @return A vector of colors in #RRGGBB format
#' @export
#'
#' @examples
#' old_palette <- palette()
#' old_pars <- par(bg = "#888888")
#' palette(penumbra::base_pal(8, "balanced"))
#' plot(1:8, pch = 19, cex = 5, col = 1:8)
#'
#' par(old_pars)
#' palette(penumbra::color_pal(8, "balanced"))
#' plot(1:8, pch = 19, cex = 5, col = 1:8)
#'
#' palette(penumbra::color_pal(8, "contrast+"))
#' plot(1:8, pch = 19, cex = 5, col = 1:8)
#'
#' palette(penumbra::color_pal(8, "contrast++"))
#' plot(1:8, pch = 19, cex = 5, col = 1:8)
#'
#' palette(old_palette)
base_pal <- function (n, contrast = c("balanced", "contrast+", "contrast++")) {
  contrast <- match.arg(contrast)
  cols <- penumbra$rgb_hex[penumbra$set == contrast & penumbra$palette == "base"]
  subset <- switch(as.character(n),
                     "2" = c(1, 9),
                     "3" = c(1, 5, 9),
                     "4" = c(2, 4, 6, 8),
                     "5" = c(1, 3, 5, 7, 9),
                     "6" = c(1, 2, 4, 6, 8, 9),
                     "7" = c(1, 2, 3, 5, 7, 8, 9),
                     "8" = 1:8,
                     "9" = 1:9,
                     stop("n must be between 2 and 9")
                   )
  cols[subset]
}


#' @rdname base_pal
#' @export
color_pal <- function (n, contrast = c("balanced", "contrast+", "contrast++")) {
  contrast <- match.arg(contrast)
  pal <- switch(as.character(n),
           "2" = "six",
           "3" = "six",
           "4" = "eight",
           "5" = "eight",
           "6" = "six",
           "7" = "seven",
           "8" = "eight",
           stop("n must be between 2 and 8")
         )
  cols <- penumbra$rgb_hex[penumbra$set == contrast & penumbra$palette == pal]
  subset <- switch(as.character(n),
              "2" = c(1, 4),
              "3" = c(1, 3, 5),
              "4" = c(1, 3, 5, 7),
              1:n
            )
  cols[subset]
}
