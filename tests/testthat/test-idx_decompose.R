test_that("Decomposition of 'INDEX_RC' to row and column information works.", {

  expect_equal(idx_decompose("0"), c(0, 0))

  expect_equal(idx_decompose("2001"), c(2, 1))

  expect_equal(idx_decompose("49011"), c(49, 11))

  expect_equal(idx_decompose("102005"), c(102, 5))

  expect_equal(idx_decompose("106078"), c(106, 78))
})
