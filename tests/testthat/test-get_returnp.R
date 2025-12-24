test_that("Getting return periods for DWD-KOSTRA-2010R works.", {

  expect_equal(get_returnp(kostra_ref, hn = 30.2, d = 1440),
               units::as_units(c(0, 1), "a"))

  expect_equal(get_returnp(kostra_ref, hn = 42.8, d = 1440),
               units::as_units(c(2, 2), "a"))

  expect_equal(get_returnp(kostra_ref, hn = 72.3, d = 1440),
               units::as_units(c(30, 50), "a"))

  expect_equal(get_returnp(kostra_ref, hn = 81.0, d = 1440),
               units::as_units(c(50, 100), "a"))

  expect_equal(get_returnp(kostra_ref, hn = 86.3, d = 1440),
               units::as_units(c(100, Inf), "a"))
})

test_that("Getting interpolated return periods for DWD-KOSTRA-2010R works.", {

  expect_error(get_returnp(kostra_ref, hn = 30.2, d = 1440, interpolate = TRUE))

  expect_equal(get_returnp(kostra_ref, hn = 42.8, d = 1440, interpolate = TRUE),
               units::as_units(2, "a"))

  expect_equal(get_returnp(kostra_ref, hn = 72.3, d = 1440, interpolate = TRUE),
               units::as_units(39.9, "a"))

  expect_equal(get_returnp(kostra_ref, hn = 81.0, d = 1440, interpolate = TRUE),
               units::as_units(94.4, "a"))

  expect_error(get_returnp(kostra_ref, hn = 86.3, d = 1440, interpolate = TRUE))
})

test_that("Getting return periods for stats from DWA-A 531 works.", {

  expect_equal(get_returnp(stats_ref, hn = 30.2, d = 1440),
               units::as_units(c(0, 1), "a"))

  expect_equal(get_returnp(stats_ref, hn = 40.7, d = 1440),
               units::as_units(c(2, 2), "a"))

  expect_equal(get_returnp(stats_ref, hn = 72.3, d = 1440),
               units::as_units(c(33, 50), "a"))

  expect_equal(get_returnp(stats_ref, hn = 81.0, d = 1440),
               units::as_units(c(50, 100), "a"))

  expect_equal(get_returnp(stats_ref, hn = 86.3, d = 1440),
               units::as_units(c(100, Inf), "a"))
})
