#' do_both()
#' @description
#' Calls [interact] and [monthly_budget_more] at the same time making the output
#' of [interact] the argument in [monthly_budget_more]
#'
#' @param interactive A logical. Indicates whether user wants to input
#' importance of different budgets aspects.
#' @param ... Other arguments passed on to layer(). These are often aesthetics,
#' used to set an aesthetic to a fixed value, like colour = "red" or size = 3.
#' They may also be parameters to the paired geom/stat.
#'
#' @examples
#' #inc = 4000
#' #do_both()
#'
#' @return
#' The output of [monthly_budget_more] using the inputed income as the income
#' argument
#'
#' @export

do_both = function(interactive = FALSE, ...){

  # calls the interact function and assigns its output to the inc variable
  inc = interact()
  my_int = interactive

  # calls the monthly_budget using the inc variable as the parameter
  monthly_budget_more(inc, interactive = my_int, ...)

}

interact = function(){

  # takes the user's monthly income and turns it into an income variable
  income = as.numeric(readline("Enter monthly income: "))

  # returns the income variable
  return(income)

}
