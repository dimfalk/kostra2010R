#' Write cell-specific statistics from KOSTRA-DWD-2010R dataset to disk
#'
#' @param x Tibble containing grid cell statistics from KOSTRA-DWD-2010R,
#'     as provided by `get_stats()`.
#' @param file (optional) character. Filename with csv extension to be used for data output.
#'
#' @export
#'
#' @seealso [get_stats()]
#'
#' @examples
#' \dontrun{
#' kostra <- get_stats("49011")
#'
#' write_stats(kostra)
#' write_stats(kostra, file = "kostra2010R_hN_49011.csv")
#' }
write_stats <- function(x = NULL,
                        file = NULL) {

  # debugging ------------------------------------------------------------------

  # x <- get_stats("49011")
  # file <- "kostra2010R_hN_49011.csv"

  # check arguments ------------------------------------------------------------

  checkmate::assert_tibble(x)

  checkmate::assert(

    checkmate::test_null(file),
    checkmate::test_character(file, len = 1, pattern = "csv$")
  )

  # main -----------------------------------------------------------------------

  # construct default filename if not specified
  if (is.null(file)) {

    file <- paste0("kostra2010R_",
                   attr(x, "type"), "_",
                   attr(x, "id"), ".csv")
  }

  # dump to disk
  utils::write.table(x,
                     file,
                     sep = "; ",
                     dec = ",",
                     na = "",
                     row.names = FALSE,
                     quote = FALSE)
}
