#' Terms
#'
#' @description Retrieve academic terms within your institution.
#'
#' @param yearlist string: comma separated vector of integers - retrieve a term by year.
#' @param data string - determine the extent of data that will be returned.
#' @param q string - search term. Use '*' as wildcard.
#' @param limit integer - limit query to specified number of records.
#' @param offset integer - used to offset queries that are segmented into chunks with limit.
#'
#' @return a \code{\link[httr]{response}} object
#' @export
#'
#' @examples
#' ## get detailed information for two terms
#' response <- fac_get_terms("2018,2019", "detailed")
#' httr::content(response)
fac_get_terms <- function(yearlist,
                          data = c("count", "summary", "detailed"),
                          q,
                          limit,
                          offset) {
  fac_get("/terms", as.list(match.call())[-1])
}
