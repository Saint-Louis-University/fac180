#' Units
#'
#' @description Retrieve academic units within your institution.
#'
#' @param unitid string: comma separated vector of integers - retrieve units with specific ids.
#' @param depth integer - how deep to recurse down the unit tree to find subunits
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## retrieve a summary listing of the first 3 academic units
#' r <- fac_get_units(data = "summary", limit = 3)
#' content(r)
#'
#' ## retrieve detailed data on the first academic unit
#' r <- fac_get_unit(unitid = "1", data = "detailed")
#' content(r)
#'
#' @name units
NULL

#' @rdname units
#' @export
fac_get_units <- function(unitid,
                          data = c("count", "summary", "detailed"),
                          q,
                          limit,
                          offset,
                          depth,
                          ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- args[c("unitid", "data", "q", "limit", "offset", "depth")]
  fac_get("/units", query, ...)
}

#' @rdname units
#' @export
fac_get_unit <- function(unitid,
                         data = c("count", "summary", "detailed"),
                         q,
                         limit,
                         offset,
                         ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- args[c("unitid", "data", "q", "limit", "offset", "depth")]
  fac_get(paste0("/units/", unitid), query, ...)
}
