#' tips
#' @description
#' A generic function in which new tips methods can be easily added for new classes.
#' @param x An object used to select a method
#'
#' @return
#' Returns tips
#' @export
#'
#' @examples
#' tips.transportation()
tips = function(x){

  UseMethod("tips")

}
