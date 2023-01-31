test_that("Getting precipitation depths for DWD-KOSTRA-2010R works.", {

  expect_equal(get_depth(kostra_ref, d = 5, tn = 1), units::as_units(5.6, "mm"))

  expect_equal(get_depth(kostra_ref, d = 4320, tn = 1), units::as_units(49.8, "mm"))

  expect_equal(get_depth(kostra_ref, d = 5, tn = 100), units::as_units(14.4, "mm"))

  expect_equal(get_depth(kostra_ref, d = 4320, tn = 100), units::as_units(108.1, "mm"))
})

test_that("Getting precipitation depths (considering uncertainties) for DWD-KOSTRA-2010R works.", {

  expect_equal(get_depth(kostra_ref, d = 1440, tn = 5, uc = TRUE), units::as_units(c(46.7, 57.1), "mm"))

  expect_equal(get_depth(kostra_ref, d = 1440, tn = 50, uc = TRUE), units::as_units(c(63.7, 86.1), "mm"))

  expect_equal(get_depth(kostra_ref, d = 1440, tn = 100, uc = TRUE), units::as_units(c(65.4, 98.2), "mm"))
})

test_that("Getting precipitation depths for stats from DWA-A 531 works.", {

  expect_equal(get_depth(stats_ref, d = 5, tn = 1), units::as_units(6.1, "mm"))

  expect_equal(get_depth(stats_ref, d = 4320, tn = 1), units::as_units(47.4, "mm"))

  expect_equal(get_depth(stats_ref, d = 5, tn = 100), units::as_units(14.2, "mm"))

  expect_equal(get_depth(stats_ref, d = 4320, tn = 100), units::as_units(102.2, "mm"))
})

test_that("Getting precipitation depths for PEN works.", {

  expect_equal(get_depth(pen_ref, d = 5, tn = 200), units::as_units(19.1, "mm"))

  expect_equal(get_depth(pen_ref, d = 4320, tn = 200), units::as_units(142.5, "mm"))

  expect_equal(get_depth(pen_ref, d = 5, tn = 10000), units::as_units(29.5, "mm"))

  expect_equal(get_depth(pen_ref, d = 4320, tn = 10000), units::as_units(214.6, "mm"))
})
