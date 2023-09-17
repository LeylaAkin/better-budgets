# function will recommend how much money the user should allocate to other, taking the user's income as a parameter
#' Other budget
#'
#' @description
#' The function takes a percentage of the inputted monthly income and allocates it to their budget for other/miscellaneous expenses that are not included in the housing, food, transportation, healthcare, or savings budgets.
#'
#' @param ... Numeric vectors. The incomes for which the user wants to get other/miscellaneous budgets.
#' @param pct A numeric vector. The percentage of income contributed to other. By default set to 0.1, the recommended percentage.
#'
#' @details
#' Similar to [housing_budget], [food_budget], [transportation_budget], [healthcare_budget], and [savings_budget]
#'
#' @return
#' Returns the recommended savings budget
#'
#' @export
#'
#' @examples
#' # create example data
#' example_income = 4000
#'
#' # Compute other budget
#' result = other_budget(example_income)
#'
other_budget = function(..., pct = 0.1){

  # creating list of ...
  dots = list(...)

  # unlisting dots
  incomes = unlist(dots)

  # added error messages to check for negative or non numeric incomes
  if(sum(incomes <= 0)){
    stop("Income value(s) must be greater than 0")
  }
  else if(!(is.numeric(incomes))){
    stop("Income value(s) must be numeric")
  }
  else if(!(is.numeric(pct))){
    stop("Percentage must be numeric.")
  }

  # calculates other budget by taking a percentage of the user's income
  other_budgets = incomes*pct

  # create data frame of budget based on income
  other_budget = data.frame(
    "income" = incomes,
    "other_budget" = other_budgets
  )

  # returns the recommended other budget
  return(other_budget)
}

