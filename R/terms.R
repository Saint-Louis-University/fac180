#' Terms
#'
#' @name terms
#'
#' @description Retrieve details of academic terms.
#'
#' @param yearlist comma separated vector of integers
#' Retrieve a term by year.
#' When defined, filters terms matching the specified year to the term's academic year.
#' When undefined, terms are not filtered by academic year.
#' Multiple values can be sent as a comma separated list.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' \dontrun{
#' ## retrieves the "term" periods that a school has set up
#' r <- fac_get_terms(data = "detailed")
#' content(r)
#'
#' ## retrieves the "term" periods that a school has set up
#' r <- fac_get_terms(data = "detailed", yearlist = "2017,2018")
#' content(r)
#' }
#'
#' @note API documentation: \url{https://faculty180.interfolio.com/swagger/ui/#tag/Terms}

#' @rdname terms
#' @export
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
