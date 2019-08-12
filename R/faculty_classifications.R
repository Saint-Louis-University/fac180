#' Faculty Classifications
#'
#' @description Retrieve details of Faculty Classifications.
#'
#' @param userlist string: comma separated vector of users - limits the bulk GET to the users in the list.
#' @param facultyclassificationlist string: comma seperated vector of integers - filter returned data to the sepcified faculty classifications.
#' @param termstart string - termid: limits classification data to the specified starting term. Defaults to current term.
#' @param termfinish string - termid: limits classification data to the specified ending term. Defaults to the current term.
#' @param unitid string - filter classifications to the specified unit.
#' @param facultyclassificationid integer - specific faculty classification.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## get count of faculty classification data
#' r <- fac_get_faculty_classification_data()
#' content(r)
#'
#' ## get count of faculty classifications
#' r <- fac_get_faculty_classifications()
#' content(r)
#'
#' ## get details on faculty classification class 1
#' r <- fac_get_faculty_classification_class(facultyclassificationid = 1, data = "detailed")
#' content(r)
#'
#' ## get details on faculty classification class 1
#' r <- fac_get_faculty_classification_class(facultyclassificationid = 2, data = "detailed")
#' content(r)
#'
#' @name faculty_classifications
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
  query <- args[c("userlist", "facultyclassificationlist", "termstart", "termfinish",
                  "data", "q", "limit", "offset")]
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
  query <- args[c("unitid",
                  "data", "q", "limit", "offset")]
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
  query <- args[c("data", "q", "limit", "offset")]
  fac_get(paste0("/facultyclassifications/-", facultyclassificationid), query, ...)
}
