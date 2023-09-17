# creating housing class for tips method
#' tips.housing
#'
#' @description Tips method for the housing class. This method prints out budgeting tips for housing.
#'
#' @param x An object used to select a method
#'
#' @details
#' Similar to [tips.food] and [tips.transportation]
#'
#' @return
#' Returns tips to help the user save money on housing.
#'
#' @export
#'
#' @examples
#' tips.housing()
tips.housing = function(x){

  cat("Budgeting Tips:\n")
  cat("Live with a roommate and divide the cost of housing.\n")
  cat("Downsize to a smaller home.\n")
  cat("If you have a mortgage: Consider refinancing your mortgage. Changing your type of mortgage or finding a lower interest rate may be able to decrease your monthly payments.\n")

}
