.onAttach <- function(libname, pkgname) {

  pkg <- "kostra2010R"

  utils::packageVersion(pkg) |> packageStartupMessage()
}
