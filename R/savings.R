

# function will recommend how much money the user should allocate to savings, taking the user's income as a parameter
#' Savings budget
#'
#' @description
#' The function takes a percentage of the inputted monthly income and allocates it to their savings budget.
#'
#' @param ... Numeric vectors. The incomes for which the user wants to get savings budgets.
#' @param pct A numeric vector. The percentage of income contributed to savings. By default set to 0.2, the recommended percentage.
#'
#' @details
#' Similar to [housing_budget], [food_budget], [transportation_budget], [healthcare_budget], and [other_budget]
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
#' # Compute savings budget
#' result = savings_budget(example_income)
#'
savings_budget = function(..., pct = 0.2){

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

  # calculates savings budget by taking 10% of the user's income
  savings_budgets = incomes*pct

  # create data frame of budget based on income
  savings_budget = data.frame(
    "income" = incomes,
    "savings_budget" = savings_budgets
  )

  # returns the recommended savings budget
  return(savings_budget)
}

