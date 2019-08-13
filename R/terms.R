#' Terms
#'
#' @description Retrieve academic terms within your institution.
#'
#' @param yearlist string: comma separated vector of integers - retrieve a term by year.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#' @export
#'
#' @examples
#' ## get summary information for one term
#' r <- fac_get_terms(yearlist = "2019", data = "summary")
#' content(r)
#'
#' ## get detailed information for two terms
#' r <- fac_get_terms(yearlist = "2018,2019", data = "detailed")
#' content(r)
#'
#' @note API documentation: \url{https://faculty180.interfolio.com/swagger/ui/#tag/Terms}
fac_get_terms <- function(yearlist,
                          data = c("count", "summary", "detailed"),
                          q,
                          limit,
                          offset,
                          ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/terms", query, ...)
}
