#' Sections
#'
#' @description Retrieve details of Sections.
#'
#' @param unitid integer: limit sections to a specific unit
#' @param sectionid integer: limit sections to a specific section
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## get detailed information on unit 1
#' r <- fac_get_sections(unitid = 1, data = "detailed")
#' content(r)
#'
#' # get detailed information on section 7
#' r <- fac_get_section(sectionid = 7, data = "detailed")
#' content(r)
#'
#' @name sections
NULL

#' @rdname sections
#' @export
fac_get_sections <- function(unitid,
                             sectionid,
                             data = c("count", "summary", "detailed"),
                             q,
                             limit,
                             offset,
                             ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- args[c("unitid", "sectionid",
                  "data", "q", "limit", "offset")]
  fac_get("/sections", query, ...)
}

#' @rdname sections
#' @export
fac_get_section <- function(sectionid,
                            data = c("count", "summary", "detailed"),
                            q,
                            limit,
                            offset,
                            ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- args[c("data", "q", "limit", "offset")]
  fac_get(paste0("/sections/-", sectionid), query, ...)
}
