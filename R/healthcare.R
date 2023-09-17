# function will recommend how much money the user should spend on healthcare, taking the user's income as a parameter
#' Healthcare budget
#'
#' @description
#' This function takes a percentage of the inputted monthly income and allocates it to their housing budget.
#'
#' @param ... Numeric vectors. The incomes for which the user wants to get healthcare budgets.
#' @param pct A numeric vector. The percentage of income contributed to healthcare. By default set to 0.1, the recommended percentage.
#'
#' @details
#' Similar to [housing_budget], [food_budget], [transportation_budget], [savings_budget], and [other_budget]
#'
#' @return
#' Returns the recommended healthcare budget
#'
#' @export
#'
#' @examples
#' # create example data
#' example_income = 4000
#'
#' # Compute healthcare budget
#' result = healthcare_budget(example_income)
#'
healthcare_budget = function(..., pct = 0.1){

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

  # calculates healthcare budget by taking a percentage of the user's income
  healthcare_budgets = incomes*pct

  # create data frame of budget based on income
  healthcare_budget = data.frame(
    "income" = incomes,
    "healthcare_budget" = healthcare_budgets
  )

  # returns the recommended other budget
  return(healthcare_budget)
}
