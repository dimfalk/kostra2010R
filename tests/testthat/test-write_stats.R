test_that("Data I/O works", {

  filename <- "kostra2010R_HN_49011.csv"

  write_stats(kostra_ref)

  kostra <- utils::read.table(file = filename,
                              header = TRUE,
                              sep = ";",
                              dec = ",",
                              na = "")

  unlink(filename)

  testthat::expect_equal(as.matrix(kostra),
                         as.matrix(kostra_ref))



  filename <- tempfile(fileext = ".csv")

  write_stats(kostra_ref, file = filename)

  kostra <- utils::read.table(file = filename,
                              header = TRUE,
                              sep = ";",
                              dec = ",",
                              na = "")

  testthat::expect_equal(as.matrix(kostra),
                         as.matrix(kostra_ref))
})
