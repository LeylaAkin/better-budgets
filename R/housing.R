# function to allocate money to housing in budget
#' Housing Budget
#'
#' @description
#' This function takes a percentage of the inputted monthly income and allocates it to their housing budget.
#'
#' @param ... Numeric vectors. The incomes for which the user wants to get housing budgets.
#' @param pct A numeric vector. The percentage of income contributed to housing. By default set to 0.3, the recommended percentage.
#' @param tip A logical parameter set to FALSE by default. If TRUE, function outputs budgeting tips.
#'
#' @details
#' Similar to [food_budget], [transportation_budget], [healthcare_budget], [savings_budget], and [other_budget]
#'
#' @return This returns the recommended housing budget.
#'
#' @export
#'
#' @examples
#' # example data
#' example_income = 3000
#'
#' # function
#' result = housing_budget(example_income)
housing_budget = function(..., pct = 0.3, tip = FALSE){

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

  # calculates housing budget by taking a percentage of the user's income
  housing_budgets = incomes*pct

  # create data frame of budget based on income
  housing_budget = data.frame(
    "income" = incomes,
    "housing_budget" = housing_budgets
  )

  # the user can request budgeting tips by setting the tip argument to true
  if(tip == TRUE){
    tips.housing()
  }

  return(housing_budget)

}
