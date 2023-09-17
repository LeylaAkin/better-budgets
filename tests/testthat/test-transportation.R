test_that("transportation works", {
  # tests that the transportation budget for an income of 4000 is 600
  expect_equal(transportation_budget(4000), 600)

  # tests that the user gets an error if they input a negative income
  expect_error(transportation_budget(-4000))

  # tests that the function prints output on the console
  expect_output(transportation_budget(4000, tip = TRUE))
})
