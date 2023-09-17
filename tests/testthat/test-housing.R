# test that function returns the correct budget calculation, has an error when income is negative, and returns output
test_that("housing function works", {

  # expect budget to be equal to 2700 when income is 9000
  expect_equal(
    housing_budget(9000, 2700),
    data.frame(
      "income" = c(9000, 2700),
      "housing_budget" = c(2700, 810)
    )
  )

  # expect error when income is negative
  expect_error(housing_budget(-9000))

  # expect output
  expect_output(housing_budget(9000, tip = TRUE))
})
