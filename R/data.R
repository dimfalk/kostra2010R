#' Data: KOSTRA-DWD-2010R
#'
#' Statistical precipitation values as a function of duration and return period
#'
#' @format A list of length 18 with simple feature collections of type POLYGON with 8,453 features and 10 fields each:
#' \describe{
#'   \item{INDEX_RC}{unique grid cell identifier}
#'
#'   \item{HN_001A_}{design precipitation depth \code{[mm]} for return period tn = 1 a}
#'   \item{HN_002A_}{design precipitation depth \code{[mm]} for return period tn = 2 a}
#'   \item{HN_003A_}{design precipitation depth \code{[mm]} for return period tn = 3 a}
#'   \item{HN_005A_}{design precipitation depth \code{[mm]} for return period tn = 5 a}
#'   \item{HN_010A_}{design precipitation depth \code{[mm]} for return period tn = 10 a}
#'   \item{HN_020A_}{design precipitation depth \code{[mm]} for return period tn = 20 a}
#'   \item{HN_030A_}{design precipitation depth \code{[mm]} for return period tn = 30 a}
#'   \item{HN_050A_}{design precipitation depth \code{[mm]} for return period tn = 50 a}
#'   \item{HN_100A_}{design precipitation depth \code{[mm]} for return period tn = 100 a}
#'
#'   \item{geometry}{polygon coordinates}
#' }
#' @source <https://opendata.dwd.de/climate_environment/CDC/grids_germany/return_periods/precipitation/KOSTRA/KOSTRA_DWD_2010R/gis/>
#' @note Last access: 2022-10-20
#' @description <https://www.dwd.de/DE/leistungen/kostra_dwd_rasterwerte/kostra_dwd_rasterwerte.html>
#' @note License: Data licence Germany – attribution – version 2.0
#' @note Copyright: Deutscher Wetterdienst 2022 (format modified)
"kostra_dwd_2010r"
