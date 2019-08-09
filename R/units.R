#' Units
#'
#' @name units
#'
#' @description Retrieve academic units within your institution.
#'
#' @param unitid string: comma separated vector of integers - retrieve units with specific ids.
#' @param data string - determine the extent of data that will be returned.
#' @param q string - search term. Use '*' as wildcard.
#' @param limit integer - limit query to specified number of records.
#' @param offset integer - used to offset queries that are segmented into chunks with limit.
#' @param depth integer - how deep to recurse down the unit tree to find subunits
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## retrieve a summary listing of the first 3 academic units
#' response <- fac_get_units(data = "summary", limit = 3)
#' httr::content(response)
#'
#' ## retrieve detailed data on the first academic unit
#' response <- fac_get_unit(1, "detailed")
#' content(response)
NULL

#' @rdname units
#' @export
fac_get_units <- function(unitid,
                          data = c("count", "summary", "detailed"),
                          q,
                          limit,
                          offset,
                          depth) {
  fac_get("/units", as.list(match.call())[-1])
}

#' @rdname units
#' @export
fac_get_unit <- function(unitid,
                         data = c("count", "summary", "detailed"),
                         q,
                         limit,
                         offset) {
  fac_get(paste0("/units/", unitid), as.list(match.call())[-1])
}
