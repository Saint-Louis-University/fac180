#' Faculty Classifications
#'
#' @name faculty_classifications
#'
#' @description Retrieve details of Faculty Classifications.
#'
#' @param userlist comma separated vector of string
#' Values should match the userid of users.
#' When defined, filter returned data to the specified users.
#' When undefined, all users are returned.
#' @param facultyclassificationlist comma separated vector of integer
#' Values should match the facultyclassificationid of faculty classifications.
#' When defined, filter returned data to the specified faculty classifications.
#' When undefined, all faculty classifications are returned.
#' @param termstart string
#' Value should match the termid of terms.
#' When defined, limits classification data to the specified starting term.
#' When undefined, defaults to the current term.
#' @param termfinish string
#' Value should match the termid of terms.
#' When defined, limits classification data to the specified ending term.
#' When undefined, defaults to the current term.
#' @param unitid integer
#' Retrieve a faculty classification with a specific unitid.
#' When defined, filters classifications to the specified unit.
#' When undefined, filters classifications from the highest unit accessible.
#' @param facultyclassificationid integer
#' Retrieves details regarding a specific faculty classification.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' \dontrun{
#' ## retrieves details regarding faculty classifications values for prescribed faculty
#' r <- fac_get_faculty_classification_data()
#' content(r)
#'
#' ## retrieves details regarding faculty classifications values for prescribed faculty
#' r <- fac_get_faculty_classification_data(userlist = "m123456", data = "detailed")
#' content(r)
#'
#' ## retrieves details regarding faculty classifications
#' r <- fac_get_faculty_classifications()
#' content(r)
#'
#' ## retrieves details regarding faculty classifications
#' r <- fac_get_faculty_classifications(unitid = 2, data = "detailed")
#' content(r)
#'
#' ## retrieves details regarding a specific faculty classification
#' r <- fac_get_faculty_classification_class(facultyclassificationid = -2, data = "detailed")
#' content(r)
#' }
#'
#' @note API documentation: \url{https://faculty180.interfolio.com/swagger/ui/#tag/Faculty-Classifications}
NULL

#' @rdname faculty_classifications
#' @export
fac_get_faculty_classification_data <- function(userlist,
                                                facultyclassificationlist,
                                                termstart,
                                                termfinish,
                                                data = c("count", "summary", "detailed"),
                                                q,
                                                limit,
                                                offset,
                                                ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/facultyclassificationdata", query, ...)
}

#' @rdname faculty_classifications
#' @export
fac_get_faculty_classifications <- function(unitid,
                                            data = c("count", "summary", "detailed"),
                                            q,
                                            limit,
                                            offset,
                                            ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/facultyclassifications", query, ...)
}

#' @rdname faculty_classifications
#' @export
fac_get_faculty_classification_class <- function(facultyclassificationid,
                                                 data = c("count", "summary", "detailed"),
                                                 q,
                                                 limit,
                                                 offset,
                                                 ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, "facultyclassificationid")
  fac_get(paste0("/facultyclassifications/-", facultyclassificationid), query, ...)
}
