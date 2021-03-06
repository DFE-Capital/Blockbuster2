% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rebuild_functions.R
\name{RecursiveBudgeting}
\alias{RecursiveBudgeting}
\title{Find blocks to rebuild within budget recursively.}
\usage{
RecursiveBudgeting(vec, keys, budget, state = NULL)
}
\arguments{
\item{vec}{A numeric vector. When called by \code{\link{Rebuild}} this
contains the cost of rebuilding blocks.}

\item{keys}{A vector. When called by \code{\link{Rebuild}} this contains the
\code{buildingids} associated with the costs in \code{vec}.}

\item{budget}{A number.}

\item{state}{(optional) This holds the selected keys during recursion.}
}
\value{
A list.  \code{.$state} holds the selected keys while \code{.$budget}
holds the unused budget.
}
\description{
An efficient recursive algorithm used by \code{\link{Rebuild}} that outputs
the \code{keys} corresponding to the unique combination of elements in the
ordered vector \code{vec} that sum to less than \code{budget}.
}
\details{
The \code{vec} and \code{keys} arguments are split into two.  The sum of the
first half of \code{vec} is compared to the budget.  If it is less then all
keys are selected, otherwise, the argument is split in half again and checked,
and so on.  Afterwards, the second half is checked if there are still monies
to spend.
}
\examples{
# Ten buildings have rebuild costs between one to ten. Spend 12 to rebuild
# the first four
blockbuster2:::RecursiveBudgeting(1:10, 1:10, 12)
# If the costs are reversed, the decision changes as the vector is ordered
blockbuster2:::RecursiveBudgeting(10:1, 1:10, 12)
}
