% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/tcc.R
\name{tcc}
\alias{tcc}
\title{Trellis Control Charts}
\usage{
tcc(n, d, x, g1, g2, breaks, data, chart = c("run", "i", "mr", "xbar", "s",
  "t", "p", "c", "u", "g"), multiply = 1, freeze = NULL, exclude,
  sum.n = FALSE, neg.y = TRUE, cex = 1, pex = 1, ylim = NULL,
  date.format = NULL, prime = TRUE, flip = FALSE, dots.only = FALSE,
  main, xlab = "Time", ylab = "Indicator", plot = TRUE, print = FALSE,
  ...)
}
\arguments{
\item{n}{Numeric vector of counts or measures to plot. Mandatory.}

\item{d}{Numeric vector of sample sizes. Mandatory for P and U charts.}

\item{x}{Subgrouping vector used for aggregating data and making x-labels.
Mandatory for Xbar and S charts.}

\item{g1}{Grouping vector 1 used for trellis layout (facets).}

\item{g2}{Grouping vector 2used for trellis layout (facets).}

\item{breaks}{Numeric vector of break points. Useful for splitting graph in
two or more sections with separate center line and control limits.}

\item{data}{Data frame containing variables.}

\item{chart}{Type of control chart. Possible types are: \itemize{ \item
"run": run chart (default). \item "i": individuals chart. \item "mr":
moving range chart. \item "xbar": sample average chart. \item "s": sample
standard deviation chart. \item "t": time between events chart. \item "p":
proportions chart. \item "c": counts chart. \item "u": rates chart. \item
"g": cases between events chart. }}

\item{multiply}{Integer indicating a number to multiply y axis by, e.g. 100
for percents rather than proportions.}

\item{freeze}{Number identifying the last data point to include in
calculations of center and limits (ignored if \code{breaks} argument is
given).}

\item{exclude}{Numeric vector of data points to exclude from calculations of
center and control lines.}

\item{sum.n}{Logical value indicating whether the mean (default) or sum of
counts should be plotted. Only relevant for run charts and I charts.}

\item{neg.y}{Logical value. If TRUE (default), the y axis is allowed to be
negative (only relevant for I and Xbar charts).}

\item{cex}{Number indicating the amount by which text should be magnified.}

\item{pex}{Number indicating the amount by which plotting symbols should be
magnified.}

\item{ylim}{Range of y axis.}

\item{date.format}{Date format of x axis labels. See \code{?strftime} for
possible date formats.}

\item{prime}{Logical value, If TRUE (default), control limits incorporate
between-subgroup variation as proposed by Laney (2002). Only relevant for P
and U charts.}

\item{flip}{Logical. If TRUE rotates the plot 90 degrees.}

\item{dots.only}{Logical value. If TRUE, data points are not connected by
lines and runs analysis is not performed. Useful for comparison and funnel
plots.}

\item{main}{Character string specifying the title of the plot.}

\item{xlab}{Character string specifying the x axis label.}

\item{ylab}{Character string specifying the y axis label.}

\item{plot}{Logical. If TRUE (default), plot chart.}

\item{print}{Logical. if TRUE, prints return value.}

\item{...}{Further arguments to ggplot function.}
}
\value{
A list of of class tcc containing values and parameters of the tcc
  plot.
}
\description{
Run and control charts for multivariate data i trellis (grid) layout.
}
\details{
\code{tcc()} is a wrapper function that uses \code{\link{ggplot2}}
  to create multivariate run and control charts. It takes up to two grouping
  variables to make one or two dimensional trellis plots.
}
\examples{
# Run chart of 24 random vaiables
tcc(rnorm(24))

# Build data frame for examples
d <- data.frame(x = rep(1:24, 4),
                mo = (rep(seq(as.Date('2013-1-1'),
                              length.out = 24,
                              by = 'month'),
                          4)),
                n = rbinom(4 * 24, 100, 0.5),
                d = round(runif(4 * 24, 90, 110)),
                g1 = rep(c('a', 'b'), each = 48),
                g2 = rep(c('A', 'B'), each = 24))

# Single, one-dimensional run chart
tcc(n, d, mo, data = subset(d, g1 == 'a' & g2 == 'A'))

# Run chart with one grouping variable and two groups
tcc(n, d, mo, g1 = g2, data = subset(d, g1 == 'a'))

# Run chart with two grouping variables
tcc(n, d, mo, g1 = g1, g2 = g2, data = d)

# I chart
tcc(n, d, mo, g1 = g1, g2 = g2, data = d, chart = 'i')

# P chart
tcc(n, d, mo, g1 = g1, g2 = g2, data = d, chart = 'p')

# P chart with baseline fixed to the first 12 data points
tcc(n, d, mo, g1 = g1, g2 = g2, data = d, chart = 'p', freeze = 12)

# P chart with two breaks
tcc(n, d, mo, g1 = g1, g2 = g2, data = d, chart = 'p', breaks = c(12, 18))

# P chart with two data points excluded from calculations
tcc(n, d, mo, g1 = g1, g2 = g2, data = d, chart = 'p', exclude = c(12, 18))
}
