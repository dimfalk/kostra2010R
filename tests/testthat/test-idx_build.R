test_that("Building of 'INDEX_RC' out of X and Y information works.", {

  expect_equal(idx_build(col = 0, row = 0), "0")

  expect_equal(idx_build(col = 1, row = 2), "2001")

  expect_equal(idx_build(col = 2, row = 1), "1002")

  expect_equal(idx_build(col = 11, row = 49), "49011")

  expect_equal(idx_build(col = 78, row = 106), "106078")
})
