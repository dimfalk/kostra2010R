test_that("Output class is as expected.", {

  m1 <- view_spatial()

  expect_s3_class(m1, c("leaflet", "htmlwidget"))



  m2 <- view_spatial("49011")

  expect_s3_class(m2, c("leaflet", "htmlwidget"))



  filename <- tempfile(fileext = ".png")

  m3 <- view_spatial("49011", file = filename)

  expect_s3_class(m3, c("leaflet", "htmlwidget"))

  expect_true(file.exists(filename))
})
