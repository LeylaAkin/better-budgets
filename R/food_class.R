# creating food class for tips method
#' tips.food
#'
#' @description Tips method for the food class. This method prints out budgeting tips for food.
#'
#' @param x An object used to select a method
#'
#' @details Similar to [tips.housing] and [tips.transportation]
#'
#' @return
#' Returns tips to help the user save money on food.
#'
#' @export
#'
#' @examples
#' tips.food()
tips.food = function(x){

  cat("Budgeting Tips:\n")
  cat("Buy food items on sale and use coupons when you can.\n")
  cat("Plan your meals, create a grocery list, and adhere strictly to your grocery list.\n")
  cat("Buy generic brands, and compare prices across stores and brands to determine cheapest price.\n")

}
