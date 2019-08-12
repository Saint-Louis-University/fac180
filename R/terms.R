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
#' ## get detailed information for two terms
#' response <- fac_get_terms("2018,2019", "detailed")
#' content(response)
fac_get_terms <- function(yearlist,
                          data = c("count", "summary", "detailed"),
                          q,
                          limit,
                          offset,
                          ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- args[c("yearlist", "data", "q", "limit", "offset")]
  fac_get("/terms", query, ...)
}
