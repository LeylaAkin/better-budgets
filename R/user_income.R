#' User Income
#' @description This function takes a user's annual income then calculates their monthly income by dividing it by 12
#'
#' @param income Numeric value greater than 0. The user's yearly income.
#'
#' @return Numeric value. The user's monthly income.
#' @export
#'
#' @examples
#' # create a dummy data
#' user_income(2000)
#'
#' # take user's annual income as input
user_income <- function(income) {

  # checking that input is numeric
  if (!is.numeric(income)) {

    # checking if input is a character with the "$" sign
    if (is.character(income) &
        "$" %in% stringr::str_split(income, "")[[1]]){
      stop("Input should be a number. \nPlease exclude the '$' sign.",
           call. = FALSE)
      # error message for all other non-numeric inputs
    } else {
      stop("Input should be a number", call. = FALSE)
    }
    # checking that input is greater than 0
  } else if (income <= 0) {
    stop("Input should be greater than 0", call. = FALSE)

  } else {
    # converting the yearly income to monthly
    monthly_income <- income/12

    # return the user's monthly income
    return(monthly_income)

  }

}

