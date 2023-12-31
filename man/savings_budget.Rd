% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/savings.R
\name{savings_budget}
\alias{savings_budget}
\title{Savings budget}
\usage{
savings_budget(..., pct = 0.2)
}
\arguments{
\item{...}{Numeric vectors. The incomes for which the user wants to get savings budgets.}

\item{pct}{A numeric vector. The percentage of income contributed to savings. By default set to 0.2, the recommended percentage.}
}
\value{
Returns the recommended savings budget
}
\description{
The function takes a percentage of the inputted monthly income and allocates it to their savings budget.
}
\details{
Similar to \link{housing_budget}, \link{food_budget}, \link{transportation_budget}, \link{healthcare_budget}, and \link{other_budget}
}
\examples{
# create example data
example_income = 4000

# Compute savings budget
result = savings_budget(example_income)

}
