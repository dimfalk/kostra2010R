test_that("Sample grid cells are available in the dataset.", {

  expect_true(idx_exists("2022"))

  expect_true(idx_exists("49011"))

  expect_true(idx_exists("104038"))
})

test_that("Random grid cell is not available in the dataset.", {

  expect_false(idx_exists("79"))

  expect_false(idx_exists("40477"))
})
