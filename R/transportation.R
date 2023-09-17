# function to allocate money to transportation in budget
#' Transportation Budget
#'
#' @description
#' This function takes a percentage of the inputted monthly income and allocates it to their transportation budget.
#'
#' @param income The user's inputted monthly income value.
#' @param pct A numeric vector. The percentage of income contributed to transportation. By default set to 0.15, the recommended percentage.
#' @param tip A logical parameter set to FALSE by default. If TRUE, function outputs budgeting tips.
#' @param rec A logical parameter set to FALSE by default. If TRUE, the function will output recommendations to save the user money.
#' @param dist The distance the user travels in a day. Set to 25 miles by default.
#' @param consump The user's vehicle consumption. Set to 25 miles by default.
#' @param cpg The fuel's price per gallon. Set to $3 by default.
#'
#' @details
#' Similar to [housing_budget], [food_budget], [healthcare_budget], [savings_budget], and [other_budget]
#'
#' @return This returns the recommended transportation budget.
#'
#' @export
#'
#' @examples
#' # example data
#' example_income = 3000
#'
#' # function
#' result = transportation_budget(example_income)
transportation_budget = function(income, pct = 0.15, tip = FALSE, rec = FALSE, dist = 25, consump = 25, cpg = 3){

  # error message if income parameter is not numeric
  if(!is.numeric(income)){
    stop("Income value(s) must be numeric.")
  }
  # error message if income is less than or equal to 0
  else if(income <= 0){
    stop("Income value(s) must be greater than 0.")
  }
  else if(!(is.numeric(pct))){
    stop("Percentage must be numeric.")
  }

  # transportation budget should be 15% of monthly income
  transportation_budg = pct*income

  # the user can request budgeting tips by setting the tip argument to true
  if(tip){
    tips.transportation()
  }

  # the user can request additional budget recommendations
  if(rec){

    cat("Transportation recommendations: \n")
    #making the add_info list into a vector
    add_info_vec = c(dist, consump, cpg)

    # created named vector
    names(add_info_vec) = c("dist","consump","cpg")

    # average cost of fuel using a given distance, consumption, and cost per gallon
    cost_fuel = (add_info_vec["dist"]/add_info_vec["consump"])*add_info_vec["cpg"]
    miles_to_travel = (transportation_budg/cost_fuel)* add_info_vec["dist"]
    cat("The average cost of fuel for ", add_info_vec["dist"], " miles is about $", cost_fuel, ". With your current budget you could travel", miles_to_travel,"miles per month.\n" )


    # average monthly cost of public transportation in the US
    pub_transp = 60
    cat("The average cost of public transportation is about $", pub_transp, "\n")

    # average time to walk based on a walking speed of 3mph
    walking = add_info_vec["dist"]/3
    cat("The average time to walk ", add_info_vec["dist"], " miles is about ", walking, " hours \n")

    #average time to bike based on a biking speed of 12mph
    biking = add_info_vec["dist"]/12
    cat("The average time to bike ", add_info_vec["dist"], " miles is about ", biking, " hours\n")

  }

  # return the transportation budget
  return(transportation_budg)

}

