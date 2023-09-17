# function will output recommendations based on income, state, and type of desired housing
#' Housing Recommendations
#'
#' @description
#' This function will output reccomendations based on the user's inputted income, state, and type of desired housing.
#'
#' @param ... These can be either numeric or character vectors. If numeric, then it must be the user's annual income. If a character, then the input must either be the abbreviation of the state for which they want to buy a house, or one of "Rent", "Conventional", "Contemporary", or "Multi-Storey Home", reflecting the kind of home they want to own.
#'
#' @details
#' This function builds on the [housing_budget] function.
#'
#' @return
#' Returns recommendations
#'
#' @export
#'
#' @examples
#'
#' library(betterBudgets)
#'
#' # Get a housing recommendation for a user living in MA, a user who earns $100,000
#' # annually, and a user who wants to own a multi-storey home
#'
#' housing_rec("MA", 100000, "Multi-Storey Home")
#'
# function for housing recommendations

housing_rec <- function(...) {

  # creating list of ...
  dots = list(...)

  # unlisting dots
  inputs = unlist(dots)

  # converting dots to output data frame
  inputs = as.character(inputs)

  # iterating through all inputs using the map_df function of the purrr package
  results = purrr::map_df(
    .x = inputs,
    .f = function(input) {
      # suppressing warnings from readr::parse_number
      suppressWarnings({

        # checking if input is in list of US state abbreviations
        if (input %in% state.abb) {

          # writing conditional to return recommended income to purchase a house by state
          if (input %in%
              c("AK", "AZ", "CA", "CO", "CT", "FL", "ID", "ME", "MD", "MA", "MT", "NV",
                "NH", "NJ", "NY", "OR", "RI", "UT", "VT", "WA")
          ) {
            output = "You can consider purchasing a home if you earn more than $90,000 annually"
          } else if (input %in%
                     c("DE", "GA", "IL", "MN", "NC", "ND", "PA", "SD", "TX", "WI", "WY")
          ) {
            output = "You can consider purchasing a home if you earn more than $80,000"
          } else if (input %in%
                     c("NE", "MI", "NM", "SC", "TN", "OH")
          ) {
            output = "You can consider purchasing a home if you earn more than $70,000"
          } else if (input %in%
                     c("AL", "AR", "IN", "IA", "KS", "KY", "LA", "MO", "OK", "WV")
          ) {
            output = "You can consider purchasing a home if you earn more than $60,000"
          } else if (input %in%
                     c("MS")
          ) {
            output = "You can consider purchasing a home if you earn more than $50,000"
          } else if (input %in% c("HI")) {
            output = "You can consider purchasing a home if you earn more than $170,000"
          }

          # checking whether input is in list of US state names
        } else if (input %in% state.name) {

          output = "Please input state abbreviations"

          # checking whether input is one of the expected home types
        } else if (
          input %in% c("Rent", "Conventional", "Contemporary", "Multi-Storey Home")
        ) {

          # writing conditionals to return recommended income for different home owenrship
          if (input == "Rent") {
            output = "Consider renting an apartment if you earn below $50,000"
          } else if (input == "Conventional") {
            output = "Consider buying a conventional style home if you earn between $50,000 and $60,000"
          } else if (input == "Contemporary") {
            output = "Consider buying a contemporary style home if you earn between $60,000 and $120,000"
          } else {
            output = "Consider buying a multi-storey home if you earn more than $120,000"
          }

          # checking whether input is a number
        } else if (!is.na(readr::parse_number(input))){
          a = readr::parse_number(input)

          # writing conditional to return recommended home ownership based on income
          if (0 >= a) {
            output = "Please check you input: incomes should be greater than 0"
          } else if (a <= 50000) {
            output = "Consider renting an apartment"
          } else if (a <= 60000) {
            output = "Consider buying a conventional style home"
          } else if (a <= 120000) {
            output = "Consider buying a contemporary style home"
          } else {
            output = "Consider buying a multi-storey home"
          }

          # turning income to a formatted number with commas and two decimal points
          income_f = formatC(round(a, 0), big.mark=',', digits = 2,
                             format = 'f')

          # changing corresponding input row in results df to formatted number
          input = paste0("Income of ", income_f)

        } else {

          # output for unexpected input
          output = "Please check your input"

        }

      })

      # returning results as a data frame
      return(data.frame("input" = input, "output" = output))
    }
  )

  return(results)

}

