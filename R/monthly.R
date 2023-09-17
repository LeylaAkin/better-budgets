#' Interact
#' @description
#' A helper function that creates an income variable created by requesting monthly input from the user
#'
#' @return
#' Returns the income entered by the user
#'
#' @export
#'
#' @examples
#' # Get budget table and distribution for income and color the graph blue
#' # monthly_budget_more(fill = "cornflowerblue", color = "black")
#'
#' @import ggplot2
#' @import magrittr "%>%"
#'
interact = function(){

  # takes the user's monthly income and turns it into an income variable
  income = as.numeric(readline("Enter monthly income: "))

  # returns the income variable
  return(income)

}

#' Monthly Budget
#' @description
#' A function that takes the income and outputs a table and graph of the budget distribution.
#'
#' @param income User's monthly income. A numeric value.
#' @param interactive A logical value. Indicates whether user wants to input importance of different budgets aspects.
#' @param ... Other arguments passed on to layer(). These are often aesthetics, used to set an aesthetic to a fixed value, like colour = "red" or size = 3. They may also be parameters to the paired geom/stat.
#'
#' @details
#' Uses the [food_budget], [housing_budget], [savings_budget], [transportation_budget], [healthcare_budget], and [other_budget] functions.
#'
#' @return A table of budget distribution and visualization of the same.
#'
#' @export
#'
#' @examples
#' # example_income = 10000
#' # Get budget table and distribution for income and color the graph blue
#' # monthly_budget_more(income = example_income, fill = "cornflowerblue", color = "black")
#'
#' @import ggplot2
#' @import magrittr "%>%"
#' @import ggplot2
#'

# making an interactive monthly budget function where users can rate their budget preference
monthly_budget_more = function(income, interactive = FALSE, ...) {
  # interactive input for income

  # error checking for numeric income
  if (is.null(income) | !is.numeric(income)) {
    stop("Please enter a number for income", call. = FALSE)
    # conditional to check whether interative argument is a logical
  } else if (!is.logical(interactive)) {
    stop(paste0("Please enter either", TRUE, "or ", FALSE, "for the interative argument"),
         call. = FALSE)
  } else {

    # standard recommended percentage of income for each type of budget
    if (interactive == FALSE) {

      food = 0.15
      health = 0.1
      housing = 0.3
      other = 0.1
      savings = 0.2
      transportation = 0.15

    } else {

      # interactive user input for rating each budget type
      food_rate = as.numeric(
        readline("Please rate food budget importance from 1-6: ")
      )
      health_rate = as.numeric(
        readline("Please rate healthcare budget importance from 1-6: ")
      )
      housing_rate = as.numeric(
        readline("Please rate housing budget importance from 1-6: ")
      )
      savings_rate = as.numeric(
        readline("Please rate savings budget importance from 1-6: ")
      )
      transportation_rate = as.numeric(
        readline("Please rate transportation budget importance from 1-6: ")
      )
      other_rate = as.numeric(
        readline("Please rate miscallaneous budget importance from 1-6: ")
      )

      # creating list of user ratings
      rates = c(food_rate, health_rate, housing_rate, savings_rate,
                transportation_rate, other_rate)

      # conditional to check that all user ratings are between 1 and 6
      if (sum(rates > 6) != 0 | sum(rates < 1) != 0) {
        stop("Please rate the importance of your budgets between 1 and 6",
             call. = FALSE)
        # checking that no ratings are duplicated
      } else if (length(unique(rates)) != 6) {
        stop("Please enter different rates for each type of budget",
             call. = FALSE)
      }

      # creating data set of budget type and ratings
      my_rates = data.frame(
        "type" = c("food", "health", "housing", "savings", "transportation", "other"),
        "rating" = rates
        # creating pct for each budget type depending on rating
      ) |> dplyr::mutate(
        "pct" = dplyr::case_when(
          rating == 1 ~ 0.30,
          rating == 2 ~ 0.22,
          rating == 3 ~ 0.18,
          rating == 4 ~ 0.13,
          rating == 5 ~ 0.10,
          rating == 6 ~ 0.07
        )
      )

      # getting pct for each budget type
      food = my_rates$pct[my_rates$type == "food"]
      health = my_rates$pct[my_rates$type == "health"]
      housing = my_rates$pct[my_rates$type == "housing"]
      savings = my_rates$pct[my_rates$type == "savings"]
      transportation = my_rates$pct[my_rates$type == "transportation"]
      other = my_rates$pct[my_rates$type == "other"]

    }

    # assigns the housing budget to the housing variable using the housing_budget function
    housing_b = housing_budget(income, pct = housing)
    housing_b = housing_b$housing_budget

    # assigns the food budget to the food variable using the food_budget function
    food_b = food_budget(income, pct = food)
    food_b = food_b$food_budget

    # assigns the housing transportation to the transportation variable using the transportation_budget function
    transportation_b = transportation_budget(income, pct = transportation)

    # assigns the healthcare budget to the healthcare variable using the healthcare_budget function
    healthcare_b = healthcare_budget(income, pct = health)
    healthcare_b = healthcare_b$healthcare_budget

    # assigns the savings budget to the savings variable using the housing_budget function
    savings_b = savings_budget(income, pct = savings)
    savings_b = savings_b$savings_budget

    # assigns the other budget to the other variable using the other_budget function
    other_b = other_budget(income, pct = other)
    other_b = other_b$other_budget

    # creating table of all budgets
    budgets = data.frame(
      "type" = c("housing", "food", "transportation",
                 "healthcare", "savings", "other"),
      "budget" = c(
        housing_b, food_b, transportation_b, healthcare_b, savings_b, other_b
      )
    )

    # creating visualization of different budget inputs
    budget_vis = ggplot2::ggplot(
      data = budgets,
      ggplot2::aes(x = type, y = budget)
    ) +
      ggplot2::geom_col(...) +
      ggplot2::scale_y_continuous(
        labels = scales::label_dollar()
      ) +
      ggplot2::theme_bw() +
      ggplot2::labs(
        x = "Part of Budget",
        y = "Budget"
      )

    return(list("budget" = budgets, "bar_plot" = budget_vis))

  }

}

