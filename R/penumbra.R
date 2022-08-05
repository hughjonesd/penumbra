
#' Return colors from the Penumbra palette
#'
#' @param n Number of colors (maximum 8).
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
  if (n > 8L) stop("No more than 8 colors are available")
  cols[seq_len(n)]
}


#' @rdname base_pal
#' @export
color_pal <- function (n, contrast = c("balanced", "contrast+", "contrast++")) {
  contrast <- match.arg(contrast)
  pal <- if (n <= 6L) "six" else if (n == 7L) "seven" else if (n == 8L) "eight"
           else stop("No more than 8 colors are available")
  cols <- penumbra$rgb_hex[penumbra$set == contrast & penumbra$palette == pal]
  cols[seq_len(n)]
}
