# creating transportation class for tips method
#' tips.transportation
#'
#' @description Tips method for the transportation class. This method prints out budgeting tips for transportation.
#'
#' @param x An object used to select a method
#'
#' @details
#' Similar to [tips.food] and [tips.housing]
#'
#' @return
#' Returns tips to help the user save money on transportation.
#'
#' @export
#'
#' @examples
#' tips.transportation()
tips.transportation = function(x){

  #Added transportation tips to save money
  cat("Budgeting Tips: \n")
  cat("Carpool with friends or co-workers. \n")
  cat("Walk or bike when possible. \n")
  cat("Consider using public transportation. \n")

}
