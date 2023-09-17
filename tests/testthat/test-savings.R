# test that function returns the correct budget calculation, has an error when income is negative, and returns output
test_that("savings function works", {

  # expect budget to be equal to 1000 when income is 5000
  expect_equal(
    savings_budget(5000, 1000),
    data.frame(
      "income" = c(5000, 1000),
      "savings_budget" = c(1000, 200)
    )
  )


  # expect error when income is negative
  expect_error(savings_budget(-5000))

})
