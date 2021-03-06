% Generated by roxygen2 (4.0.1): do not edit by hand
\name{bgbb.PlotRecVsConditionalExpectedFrequency}
\alias{bgbb.PlotRecVsConditionalExpectedFrequency}
\title{BG/BB Plot Recency vs Conditional Expected Frequency}
\usage{
bgbb.PlotRecVsConditionalExpectedFrequency(params, n.star, rf.matrix, x.star,
  trunc = NULL, xlab = "Calibration period recency",
  ylab = "Holdout period transactions", xticklab = NULL,
  title = "Conditional Expected Transactions by Recency")
}
\arguments{
\item{params}{BG/BB parameters - a vector with alpha, beta, gamma, and delta, in that order. Alpha and beta are unobserved parameters for the beta-Bernoulli transaction process. Gamma and delta are unobserved parameters for the beta-geometric dropout process.}

\item{n.star}{number of transaction opportunities in the holdout period.}

\item{rf.matrix}{recency-frequency matrix. It must contain columns for frequency ("x"), recency ("t.x"), number of transaction opportunities in the calibration period ("n.cal"), and the number of customers with this combination of recency, frequency and transaction opportunities in the calibration period ("custs"). Note that recency must be the time between the start of the calibration period and the customer's last transaction, not the time between the customer's last transaction and the end of the calibration period.}

\item{x.star}{a vector containing the number of transactions made in the holdout period by the groups of customers with the same recency and frequency in the calibration period. It must be in the same order as the rf.matrix.}

\item{trunc}{optional integer used to truncate the plot. In the plot, all
calibration period frequencies above the truncation number will be
removed. If the truncation number is greater than the maximum
frequency, R will warn you and change it to the maximum frequency.}

\item{xlab}{descriptive label for the x axis.}

\item{ylab}{descriptive label for the y axis.}

\item{xticklab}{vector containing a label for each tick mark on the x axis.}

\item{title}{title placed on the top-center of the plot.}
}
\value{
Holdout period transaction frequency comparison
matrix (actual vs. expected), binned according
calibration period recency.
}
\description{
Plots the actual and conditional expected number of transactions
made by customers in the holdout period, binned according to
calibration period recencies. Also returns a matrix with this
comparison and the number of customers in each bin.
}
\examples{
data(donationsSummary)

rf.matrix <- donationsSummary$rf.matrix
# donationsSummary$rf.matrix already has appropriate column names

# starting-point parameters
startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
est.params <- bgbb.EstimateParameters(rf.matrix, startingparams)

# get the holdout period transactions
x.star <- donationsSummary$x.star

# number of transaction opportunities in the holdout period
n.star <- 5

# Compare holdout period transactions.
bgbb.PlotRecVsConditionalExpectedFrequency(est.params, n.star, rf.matrix, x.star, trunc=6)
}
\references{
Fader, Peter S., Bruce G.S. Hardie, and Jen Shang. \dQuote{Customer-Base Analysis in a Discrete-Time Noncontractual Setting.} \emph{Marketing Science} 29(6), pp. 1086-1108. 2010. INFORMS. \url{http://www.brucehardie.com/papers/020/}
}

