#' Get cell-specific uncertainty estimates from the KOSTRA-DWD-2020 dataset
#'
#' @param x character. Relevant "INDEX_RC" field to be queried.
#'
#' @return Tibble containing statistical uncertainties \code{[\%]} as a function of
#'     duration and return periods for the KOSTRA-DWD-2020 grid cell specified.
#' @export
#'
#' @seealso [idx_build()]
#'
#' @references
#' Malitz, G. & Ertel, H. (2015): KOSTRA-DWD-2010 -
#'     Starkniederschlagshöhen für Deutschland (Bezugszeitraum 1951 bis 2010).
#'
#' @examples
#' get_uncertainties("42016")
get_uncertainties <- function(x = NULL) {

  # debugging ------------------------------------------------------------------

  # x <- "42016"

  # check arguments ------------------------------------------------------------

  checkmate::assert_character(x, len = 1, min.chars = 1, max.chars = 6)

  stopifnot("'INDEX_RC' specified does not exist." = idx_exists(x))

  # pre-processing -------------------------------------------------------------

  res <- get_stats(x)

  # main -----------------------------------------------------------------------

  # adjust colnames
  cnames <- colnames(res) |> stringr::str_replace_all(pattern = "HN_", replacement = "UC_")

  colnames(res) <- cnames

  # quantify uncertainties, as given by Malitz & Ertel (2015)
  res["UC_001A"] <- 10
  res["UC_002A"] <- 10
  res["UC_003A"] <- 10
  res["UC_005A"] <- 10

  res["UC_010A"] <- 15
  res["UC_020A"] <- 15
  res["UC_030A"] <- 15
  res["UC_050A"] <- 15

  res["UC_100A"] <- 20

  # post-processing ------------------------------------------------------------

  # adjust meta data
  attr(res, "type") <- "UC"

  res
}
