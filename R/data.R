#' Data: KOSTRA-DWD-2010R
#'
#' Statistical precipitation values as a function of duration and return period
#'
#' @format A list of length 18 representing duration levels with simple feature collections of type POLYGON with 5,405 features and 11 fields each:
#' \describe{
#'   \item{INDEX_RC}{numeric. Unique grid cell identifier.}
#'
#'   \item{HN_001A_}{numeric. Design precipitation depth \code{[mm]} for return period Tn = 1 a.}
#'   \item{HN_002A_}{numeric. Design precipitation depth \code{[mm]} for return period Tn = 2 a.}
#'   \item{HN_003A_}{numeric. Design precipitation depth \code{[mm]} for return period Tn = 3 a.}
#'   \item{HN_005A_}{numeric. Design precipitation depth \code{[mm]} for return period Tn = 5 a.}
#'   \item{HN_010A_}{numeric. Design precipitation depth \code{[mm]} for return period Tn = 10 a.}
#'   \item{HN_020A_}{numeric. Design precipitation depth \code{[mm]} for return period Tn = 20 a.}
#'   \item{HN_030A_}{numeric. Design precipitation depth \code{[mm]} for return period Tn = 30 a.}
#'   \item{HN_050A_}{numeric. Design precipitation depth \code{[mm]} for return period Tn = 50 a.}
#'   \item{HN_100A_}{numeric. Design precipitation depth \code{[mm]} for return period Tn = 100 a.}
#'
#'   \item{geometry}{sfc_GEOMETRY. Coordinates.}
#' }
#' @source <https://opendata.dwd.de/climate_environment/CDC/grids_germany/return_periods/precipitation/KOSTRA/KOSTRA_DWD_2010R/gis/>
#' @note Last access: 2026-01-05
#' @description <https://www.dwd.de/DE/leistungen/kostra_dwd_rasterwerte/kostra_dwd_rasterwerte.html>
#' @note License: CC BY 4.0
#' @note Copyright: Deutscher Wetterdienst 2022 (format modified)
"kostra_dwd_2010r"
