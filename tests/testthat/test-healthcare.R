test_that("healthcare works", {
  expect_equal(
    healthcare_budget(4000, 400),
    data.frame(
      "income" = c(4000, 400),
      "healthcare_budget" = c(400, 40)
    )
    )
})
