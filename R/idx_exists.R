#' Check whether given "INDEX_RC" is present in KOSTRA-DWD-2010R dataset
#'
#' @param x character. Relevant "INDEX_RC" field to be queried.
#'
#' @return logical.
#' @export
#'
#' @examples
#' idx_exists("49011")
idx_exists <- function(x = NULL) {

  # debugging ------------------------------------------------------------------

  # x <- "49011"

  # check arguments ------------------------------------------------------------

  checkmate::assert_character(x, len = 1, min.chars = 1, max.chars = 6)

  # main -----------------------------------------------------------------------

  # return boolean
  x %in% kostra_dwd_2010r[[1]][["INDEX_RC"]]
}
