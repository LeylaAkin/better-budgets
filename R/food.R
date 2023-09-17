# function to allocate money to food in budget
#' Food Budget
#'
#' @description
#' This function takes a percentage of the inputted monthly income and allocates it to their food budget.
#'
#' @param ... Numeric vectors. The incomes for which the user wants to get food budgets.
#' @param pct A numeric vector. The percentage of income contributed to food. By default set to 0.15, the recommended percentage.
#' @param tip A logical parameter set to FALSE by default. If TRUE, function outputs budgeting tips.
#' @param food_split A logical parameter set to FALSE by default. If TRUE, function splits up the food budget and calculates how much of income should be spent on groceries and takeout.
#'
#' @details
#' Similar to [housing_budget], [transportation_budget], [healthcare_budget], [savings_budget], and [other_budget]
#'
#' @return This returns the recommended food budget.
#'
#' @export
#'
#' @examples
#' # example data
#' example_income = 3000
#'
#' # function
#' result = food_budget(example_income)
food_budget = function(..., pct = 0.15, tip = FALSE, food_split = FALSE){

  # creating list of ...
  dots = list(...)

  # unlisting dots
  incomes = unlist(dots)

  # added error messages to check for negative or non numeric incomes
  if(sum(incomes <= 0)){
    stop("Income value(s) must be greater than 0.")
  }
  else if(!(is.numeric(incomes))){
    stop("Income value(s) must be numeric.")
  }
  else if(!(is.numeric(pct))){
    stop("Percentage must be numeric.")
  }

  # calculates food budget by taking a percentage of the user's income
  food_budgets = incomes*pct

  # create data frame of budget based on income
  food_budget = data.frame(
    "income" = incomes,
    "food_budget" = food_budgets
  )

  if(food_split == TRUE){

    # calculated budget that should be spent on groceries
    groceries = (pct/2 + 0.01) * incomes
    # calculated budget that should be spent on takeout food
    takeout = (pct/2 - 0.01) * incomes

    # create vector of groceries and takeout budgets
    food_budget["groceries"] = groceries
    food_budget["takeout"] = takeout

  }

  # the user can request budgeting tips by setting the tip argument to true
  if(tip == TRUE){
    tips.food()
  }

  # returns the recommended food budget
  return(food_budget)
}
