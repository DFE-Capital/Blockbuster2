% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/update_costs_functions.R
\name{UpdateElementRepairs}
\alias{UpdateElementRepairs}
\title{Update the repair costs for components in an element-level data frame.}
\usage{
UpdateElementRepairs(element.data)
}
\arguments{
\item{element.data}{An element-level data frame.}
}
\value{
An element-level data frame with updated repair totals.
}
\description{
Computes the total cost of repairing each component at each grade using the
formula unit area * unit repair cost * proportion at grade.
}
\examples{
blockbuster2:::UpdateElementRepairs(simulated_elements)
}
