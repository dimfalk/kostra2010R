# version 0.13.1

## features

- `get_pdepth()` now allows to determine statistical precipitation depths
- `get_centroid()` now allows determination of coordinates based on municipality names and postal codes
- `get_returnp()` now allows interpolation of return periods with `interpolate = TRUE`
- `get_depth()` now allows to consider uncertainties with `uc = TRUE`
- `get_stats()` now optionally return precipitation yield values with `as_depth = FALSE`
- `write_stats()` now wraps `write.table()` to facilitate dumping stats to disk
- `plot_idf` now allows to visualize intensity-duration-frequency curves per tile
- `view_spatial()` now allows to interactively explore tile locations, with optional output to disk


## enhancements

- `get_pdepth()` and `get_returnp()` now return values supplemented by units
- `get_centroid()` now prompts an error when the object returned contains no hits
- package data has been imported using `sf::read_sf()` instead of `sf::st_read()`
- proper internal unit conversion when using `as_yield()` and `as_depth()`
- `kostra_dwd_2010r` dataset now has actual `NA` values instead of `-99.9` placeholders
- general cleaning and harmonization of roxygen2 function documentation
- `get_centroid()` now makes use of the Nominatim API via `tidygeocoder::geocode()` for forward geocoding instead of using datasets shipped with the package


## bug fixes 

- `get_returnp()` now returns consistent output for tn < 1 and tn > 100
- `get_returnp()` now also works on tibbles returned by `calc_pen()`
- `as_yield()` and `as_depth()` now accept `x` with a length of 2
