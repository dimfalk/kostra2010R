#' Get precipitation depth for a specified duration level and return period
#'
#' @param x Tibble containing grid cell statistics from KOSTRA-DWD-2010R,
#'     as provided by `get_stats()`.
#' @param d numeric. Precipitation duration level \code{[min]}.
#' @param tn numeric. Return period \code{[a]}.
#' @param uc (optional) logical. Consider overall ucties, as proposed in
#'     Malitz & Ertel (2015)?
#'
#' @return units. Precipitation depth \code{[mm]}.
#' @export
#'
#' @seealso \link{get_stats}
#'
#' @references
#' Malitz, G. & Ertel, H. (2015): KOSTRA-DWD-2010 -
#'     Starkniederschlagshöhen für Deutschland (Bezugszeitraum 1951 bis 2010).
#'
#' @examples
#' kostra <- get_stats("49011")
#'
#' get_depth(kostra, d = 60, tn = 50)
#' get_depth(kostra, d = 60, tn = 50, uc = TRUE)
get_depth <- function(x = NULL,
                      d = NULL,
                      tn = NULL,
                      uc = FALSE) {

  # debugging ------------------------------------------------------------------

  # x <- get_stats("49011")
  # d <- 60
  # tn <- 50
  # uc <- TRUE

  # check arguments ------------------------------------------------------------

  checkmate::assert_tibble(x)

  allowed_d <- attr(x, "durations_min")
  checkmate::assert_numeric(d, len = 1)
  checkmate::assert_choice(d, allowed_d)

  allowed_tn <- attr(x, "returnperiods_a")
  checkmate::assert_numeric(tn, len = 1)
  checkmate::assert_choice(tn, allowed_tn)

  checkmate::assert_logical(uc)

  # main -----------------------------------------------------------------------

  # get index and return object
  ind <- which(attr(x, "returnperiods_a") == tn)

  hn <- x[x[["D_min"]] == d, ind + 3] |> as.numeric()

  if (uc == TRUE) {

    p <- switch(as.character(tn),

                "1" = 0.10,
                "2" = 0.10,
                "3" = 0.10,
                "5" = 0.10,
                "10" = 0.15,
                "20" = 0.15,
                "30" = 0.15,
                "50" = 0.15,
                "100" = 0.20)

    hn <- c(hn * (1 - p), hn * (1 + p)) |> round(1)
  }

  units::as_units(hn, "mm")
}
