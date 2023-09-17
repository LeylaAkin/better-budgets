library(betterBudgets)
library(testthat)

test_that(
  "testing for invalid inputs", {
    expect_error(
      other_budget("a"),
      regexp = "must be numeric"
    )
    expect_error(
      other_budget(-1000),
      regexp = "must be greater than 0"
    )
  }
)

test_that(
  "testing for correct output", {
    expect_equal(
      other_budget(1000, 100),
      data.frame(
        "income" = c(1000, 100),
        "other_budget" = c(100, 10)
      )
    )
  }
)
