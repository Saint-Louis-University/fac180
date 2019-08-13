#' User Data
#'
#' @name user_data
#'
#' @description Retrieves a users activity information.
#'
#' @param unitid integer
#' Retrieve a unit with a specific unitid.
#' When defined, sections are limited to those found at the specified unit.
#' When undefined, all sections are returned.
#' @param sectionid integer
#' Retrieve a section with a specific sectionid.
#' When defined, limits the sections to only the specified section.
#' When undefined, all sections are returned.
#' @param category string
#' Valid values are profile and activity_input.
#' When defined, limits the sections to the specified form.
#' When undefined, all sections are returned.
#' @param termstart string
#' Value should match the termid of terms.
#' When defined, limits activities to the specified starting term.
#' When undefined, the furthest back term is used.
#' @param termfinish string
#' Value should match the termid of terms.
#' When defined, limits activities to the specified ending term.
#' When undefined, defaults to the current term.
#' @param userlist comma seperated vector of string
#' Values should match the userid of users.
#' When defined, filter returned data to the specified users.
#' When undefined, all users are returned.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## get user data
#' r <- fac_get_user_data()
#' content(r)
#'
#' @note API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/User-Data}
NULL

#' @rdname user_data
#' @export
fac_get_user_data <- function(unitid,
                              sectionid,
                              category,
                              termstart,
                              termfinish,
                              userlist,
                              q,
                              limit,
                              offset,
                              ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/userdata", query, ...)
}
