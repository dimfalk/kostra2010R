#' Build "INDEX_RC" identifier based on given row and column information
#'
#' @param row integer. Row number, one pick from set \{0:106\}.
#' @param col integer. Column number, one pick from set \{0:78\}.
#'
#' @return character. Unique representation of the relevant "INDEX_RC" field.
#' @export
#'
#' @seealso [idx_decompose()]
#'
#' @examples
#' idx_build(row = 42, col = 16)
idx_build <- function(row = NULL,
                      col = NULL) {

  # debugging ------------------------------------------------------------------

  # row <- 42
  # col <- 16

  # check arguments ------------------------------------------------------------

  checkmate::assert_numeric(row, len = 1, lower = 0, upper = 106)
  checkmate::assert_numeric(col, len = 1, lower = 0, upper = 78)

  # main -----------------------------------------------------------------------

  # line number multiplied by 1000 plus column number
  as.character(row * 1000 + col)
}
