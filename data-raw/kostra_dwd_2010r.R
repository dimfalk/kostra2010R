## code to prepare `kostra_dwd_2010r` dataset goes here

base_url <- "https://opendata.dwd.de/climate_environment/CDC/grids_germany/return_periods/precipitation/KOSTRA/KOSTRA_DWD_2010R/gis/"

d <- c(5, 10, 15, 20, 30, 45, 60, 90, 120, 180, 240, 360, 540, 720, 1080, 1440, 2880, 4320)

d_pad <- stringr::str_pad(d, width = 4, pad = "0")

fnames <- paste0("GIS_KOSTRA-DWD-2010R_D", d_pad,".zip")

urls <- paste0(base_url, fnames)

# download and unzip files
for (i in 1:length(fnames)) {

  utils::download.file(urls[i], fnames[i])

  utils::unzip(fnames[i])

  unlink(fnames[i])
}

files_shp <- list.files(pattern = "shp$", recursive = TRUE)

kostra_dwd_2010r <- list()

# build list of sf objects
for (i in 1:length(d)) {

  ds <- paste0("D", d_pad[i])

  assign(ds, files_shp[i] |> sf::read_sf())

  # replace -99.9 in relevant columns by actual NA values, drop empty rows
  cnames <- get(ds) |> colnames() |> stringr::str_subset(pattern = "HN_")

  res <- get(ds) |>
    dplyr::mutate(dplyr::across(dplyr::all_of(cnames), dplyr::na_if, -99.9)) |>
    dplyr::filter(dplyr::if_all(dplyr::all_of(cnames), ~ !is.na(.)))

  assign(ds, res)

  kostra_dwd_2010r[[ds]] <- get(ds)
}

usethis::use_data(kostra_dwd_2010r, overwrite = TRUE)

stringr::str_sub(fnames, 1, -5) |> unlink(recursive = TRUE)
