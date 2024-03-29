% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/base.R
\name{fac_build_query_list}
\alias{fac_build_query_list}
\title{Build Query List}
\usage{
fac_build_query_list(call_args, path_args = NULL, httr_args = "...")
}
\arguments{
\item{call_args}{named list
Argument names and values that were passed in the original call.}

\item{path_args}{string vector
Names of arguments to remove due to use in the API path.}

\item{httr_args}{string vector
Names of arguments to remove due to being passed to \code{\link[httr]{GET}}}
}
\value{
named list of query strings to pass to \code{\link[httr]{GET}}
}
\description{
Build Query List
}
\examples{
\dontrun{
call_args <- lapply(as.list(match.call())[-1], eval.parent)
query <- fac_build_query_list(call_args, "an_api_path_arg", "...")
}
}
