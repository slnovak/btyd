% Generated by roxygen2 (4.0.1): do not edit by hand
\name{spend.EstimateParameters}
\alias{spend.EstimateParameters}
\title{Spend Parameter Estimation}
\usage{
spend.EstimateParameters(m.x.vector, x.vector, par.start = c(1, 1, 1),
  max.param.value = 10000)
}
\arguments{
\item{m.x.vector}{a vector with each customer's average observed
transaction value in the calibration period.}

\item{x.vector}{a vector with the number of transactions each
customer made in the calibration period. Must correspond to
m.x.vector in terms of ordering of customers and length of the
vector.}

\item{par.start}{initial vector of gamma-gamma parameters: p, q,
and gamma, in that order. p is the shape parameter for each
transaction. The scale parameter for each transaction is
distributed across customers according to a gamma distribution
with parameters q (shape) and gamma (scale).}

\item{max.param.value}{the upper bound on parameters.}
}
\value{
Vector of estimated parameters.
}
\description{
Estimates parameters for the gamma-gamma spend model.
}
\details{
The best-fitting parameters are determined using the \code{\link{spend.LL}}
function. The sum of the log-likelihood for each customer (for a
set of parameters) is maximized in order to estimate parameters.

A set of starting parameters must be provided for this method. If
no parameters are provided, (1,1,1,1) is used as a default. It may
be necessary to run the estimation from multiple starting points
to ensure that it converges. To compare the log-likelihoods of
different parameters, use \code{\link{spend.LL}}.

The lower bound on the parameters to be estimated is always zero,
since gamma-gamma parameters cannot be negative. The upper bound
can be set with the max.param.value parameter.
}
\examples{
data(cdnowSummary)
ave.spend <- cdnowSummary$m.x
tot.trans <- cdnowSummary$cbs[,"x"]

# There will be many warnings due to the zeroes that are
# included in the data above. To avoid them, use the following:
# (see example for spend.LL)

ave.spend <- ave.spend[which(tot.trans > 0)]
tot.trans <- tot.trans[which(tot.trans > 0)]

# We will let the spend function use default starting parameters
spend.EstimateParameters(ave.spend, tot.trans)
}

