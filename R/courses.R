#' Courses
#'
#' @name courses
#'
#' @description Retrieve details of Courses (Prefixes, Courses Taught, Attachments).
#'
#' @param unitid comma separated vector of integers
#' When defined, filters for course with given course prefix.
#' When undefined, all prefixes are returned.
#' @param prefixes comma separated vector of string
#' When defined, filters for course with given course prefix.
#' When undefined, all prefixes are returned.
#' @param extra comma separated vector of string
#' When included, additional details are indexed and included in the returned array.
#' @param termid string
#' Value should match the termid of terms.
#' When defined, filter courses that were taught during the specified term.
#' When undefined, courses are not filtered by term.
#' @param userlist comma separated vector of string
#' Values should match the userid of users.
#' When defined, filter returned courses by the specified users.
#' When undefined, courses are not filtered by users
#' @param coursestaughtid string
#' Specify a coursestaughtid to retrieve details.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' \dontrun{
#' ## retrieves course prefixes
#' r <- fac_get_course_prefixes()
#' content(r)
#'
#' ## retrieves course prefixes
#' r <- fac_get_course_prefixes(data = "detailed")
#' content(r)
#'
#' ## retrieves courses
#' r <- fac_get_courses()
#' content(r)
#'
#' ## retrieves courses
#' r <- fac_get_courses(data = "detailed", exta = "title,description")
#' content(r)
#'
#' ## retrieves details regarding the course catalog
#' r <- fac_get_courses_taught()
#' content(r)
#'
#' ## retrieves details regarding the course catalog
#' r <- fac_get_courses_taught(data = "detailed", termid = "2015/02")
#' content(r)
#'
#' ## retrieves details regarding a single item in the course catalog
#' r <- fac_get_courses_taught_id(coursestaughtid = 150)
#' content(r)
#'
#' ## retrieves details regarding a single item in the course catalog
#' r <- fac_get_courses_taught_id(coursestaughtid = 150, data = "detailed", termid = "2015/02")
#' content(r)
#'
#' ## retrieves details regarding the attachments of courses taught
#' r <- fac_get_courses_taught_id_attachment(coursestaughtid = 150)
#' content(r)
#'
#' ## retrieves details regarding the attachments of courses taught
#' r <- fac_get_courses_taught_id_attachment(coursestaughtid = 150)
#' content(r)
#' }
#'
#' @note API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/Courses}
NULL

#' @rdname courses
#' @export
fac_get_course_prefixes <- function(unitid,
                                    data = c("count", "summary", "detailed"),
                                    q,
                                    limit,
                                    offset,
                                    ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/courseprefixes", query, ...)
}

#' @rdname courses
#' @export
fac_get_courses <- function(prefixes,
                            extra = c("title", "description", "credithours", "lecturehours", "labhours", "extrahours", "extrahourslabel", "courselevel", "cipcode"),
                            data = c("count", "summary", "detailed"),
                            q,
                            limit,
                            offset,
                            ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/courses", query, ...)
}

#' @rdname courses
#' @export
fac_get_courses_taught <- function(termid,
                                   userlist,
                                   data = c("count", "summary", "detailed"),
                                   q,
                                   limit,
                                   offset,
                                   ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/coursestaught", query, ...)
}

#' @rdname courses
#' @export
fac_get_courses_taught_id <- function(coursestaughtid,
                                      termid,
                                      userlist,
                                      data = c("count", "summary", "detailed"),
                                      q,
                                      limit,
                                      offset,
                                      ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, "coursestaughtid")
  fac_get(paste0("/coursestaught/", coursestaughtid), query, ...)
}

#' @rdname courses
#' @export
fac_get_courses_taught_id_attachment <- function(coursestaughtid,
                                                 data = c("count", "summary", "detailed"),
                                                 q,
                                                 limit,
                                                 offset,
                                                 ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, "coursestaughtid")
  fac_get(paste("/coursestaught", coursestaughtid, "attachments", sep = "/"), query, ...)
}
