#' Units
#'
#' @name units
#'
#' @description Create & retrieve details of academic units.
#'
#' @param unitid comma separated vector of integers
#' Retrieve a unit with specific unitid(s).
#' When defined, the unit specified and any sub-units are returned down the whole depth of the unit tree.
#' When undefined, highest unit accessible and any sub-units are returned.
#' Multiple values can be sent as a comma separated list.
#' @param depth integer
#' When defined, specifies how deep to recurse down the unit tree to find subunits.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' \dontrun{
#' ## retrieves a listing of academic units
#' r <- fac_get_units(data = "detailed")
#' content(r)
#'
#' ## retrieves a listing of academic units
#' r <- fac_get_units(data = "detailed", unitid = 2)
#' content(r)
#'
#' ## retrieves details on the specific unit
#' r <- fac_get_unit(unitid = 2, data = "detailed")
#' content(r)
#' }
#'
#' @note API documentation: \url{https://faculty180.interfolio.com/swagger/ui/#tag/Units}
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
  query <- fac_build_query_list(args)
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
  query <- fac_build_query_list(args)
  fac_get(paste0("/units/", unitid), query, ...)
}
