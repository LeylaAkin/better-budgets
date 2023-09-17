# test that function returns the correct budget calculation, has an error when income is negative, and returns output
test_that("food function works", {

  # expect budget to be equal to 450 when income is 3000
  expect_equal(
    food_budget(3000, 450),
    data.frame(
      "income" = c(3000, 450),
      "food_budget" = c(450, 67.5)
    )
  )

  # expect error when income is negative
  expect_error(food_budget(-3000))

  # expect output
  expect_output(food_budget(3000, tip = TRUE))
})
