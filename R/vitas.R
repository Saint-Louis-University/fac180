#' Vitas
#'
#' @name vitas
#'
#' @description Retrieve details of users' vitaes.
#'
#' @param unitid integer
#' Enter a unitid to retrieve evaluation data from that specific unit.
#' When defined, filter evaluations to the specified unit.
#' When undefined, filters evaluations from the highest unit accessible.
#' @param vitaid integer
#' Retrieves details for the specified vitae.
#' @param userid string
#' Retrieves details on the specified user(s).
#' @param termstart string
#' Value should match the termid of terms.
#' When defined, limits classification data to the specified starting term.
#' When undefined, defaults to the current term.
#' @param termfinish string
#' Value should match the termid of terms.
#' When defined, limits classification data to the specified ending term.
#' When undefined, defaults to the current term.
#' @param output string
#' A list of Vitaes.
#' If output=json
#' Returns an array of values for the specified vitas, as well as enabled sections on the vita.
#' If output=html
#' Directly displays vita requested as an HTML document with Styling as it would display directly from the software.
#' If output=html_clean
#' Directly displays vita requested as an HTML document with:
#' All inline styling from DATA180 default styling is removed.
#' All styling from a user as supplied from rich text edited text is removed (this will be corrected in a later release to try to honor this styling).
#' Styling applied to each scholarly work for formatting each scholarly citation with the appropriate citation style is retained.
#' @param tenant_id integer
#' Tenant associated with the request.
#' @param search_text string
#' Search term.
#' @param limit integer
#' Limit query to specified number of records.
#' @param page integer
#' Limit query to specified page of records.
#' @param sort_by string
#' Sort the results by a desired column.
#' @param descending logical
#' When true, the sort column is sorted in descending order.
#' @param pid integer
#' User pid filter for the given request.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## get count of vitas
#' r <- fac_get_vitas()
#' content(r)
#'
#' @note API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/Vitas}
NULL

#' @rdname vitas
#' @export
fac_get_vitas <- function(unitid,
                          data = c("count", "summary", "detailed"),
                          q,
                          limit,
                          offset,
                          ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/vitas", query, ...)
}

#' @rdname vitas
#' @export
fac_get_vita <- function(vitaid,
                         userid,
                         termstart,
                         termfinish,
                         output = c("json", "html", "html_clean"),
                         q,
                         limit,
                         offset,
                         ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, c("vitaid", "userid"))
  fac_get(paste("/vitas", vitaid, userid, sep = "/"), query, ...)
}

#' @rdname vitas
#' @export
fac_get_vita_templates <- function(tenant_id,
                                   search_text,
                                   limit,
                                   page,
                                   sort_by,
                                   descending,
                                   pid,
                                   ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get(paste0("/", tenant_id, "/vita_templates"), query, ...)
}
