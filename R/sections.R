#' Sections
#'
#' @name sections
#'
#' @description Retrieve details of Sections.
#'
#' @param unitid integer
#' Retrieve a section with a specific unitid.
#' When defined, sections are limited to those found at the specified unit.
#' When undefined, all sections are returned.
#' @param sectionid integer
#' Retrieve a section with a specific sectionid.
#' When defined, limits the sections to only the specified section.
#' When undefined, all sections are returned
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' \dontrun{
#' ## retrieves data sections
#' r <- fac_get_sections()
#' content(r)
#'
#' # retrieves data sections
#' r <- fac_get_sections(sectionid = 5, data = "summary")
#' content(r)
#'
#' ## retrieves information on a specific section
#' r <- fac_get_section(sectionid = -15)
#' content(r)
#'
#' # retrieves information on a specific section
#' r <- fac_get_section(sectionid = -15, data = "summary")
#' content(r)
#' }
#'
#' @note API documentation: \url{https://faculty180.interfolio.com/swagger/ui/#tag/Sections}
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
  query <- fac_build_query_list(args)
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
  query <- fac_build_query_list(args, "sectionid")
  fac_get(paste0("/sections/-", sectionid), query, ...)
}
