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
#' stats <- get_stats("42016")
#'
#' write_stats(stats)
#' write_stats(stats, file = "kostra2010R_hN_42016.csv")
#' }
write_stats <- function(x = NULL,
                        file = NULL) {

  # debugging ------------------------------------------------------------------

  # x <- get_stats("42016")
  # file <- "kostra2010R_hN_42016.csv"

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
