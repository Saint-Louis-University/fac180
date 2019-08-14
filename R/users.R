#' Users
#'
#' @name users
#'
#' @description Create, update and retrieve details of users.
#'
#' @param unitid comma separated vector of integers
#' Retrieve a user with specific unitid(s)
#' When defined, filters users with given unitid as their primary unit.
#' When undefined, all users for all units are returned.
#' Multiple values can be sent as a comma separated list.
#' @param userid string
#' Retrieves full profile details on the specified user(s).
#' By default the only data that is returned for a given user is basic identifying information, if other user details are needed they should be specified using the “extra” parameter.
#' @param employmentstatus string
#' When defined, users are filtered by their employment status.
#' @param extra comma seperated vector of string
#' Multiple values can be sent as a comma separated list.
#' When included, additional details are indexed and included in the returned array.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' \dontrun{
#' ## retrieves a listing of users and basic identifying information for each
#' r <- fac_get_users(data = "detailed")
#' content(r)
#'
#' ## retrieves a listing of users and basic identifying information for each
#' r <- fac_get_users(data = "detailed", employmentstatus = "Full+Time")
#' content(r)
#'
#' ## retrieves full profile details on the specified user(s)
#' r <- fac_get_user(userid = "m123456")
#' content(r)
#'
#' ## retrieves full profile details on the specified user(s)
#' r <- fac_get_user(userid = "m123456", data = "detailed", extra = "honorific,phone, acounttype")
#' content(r)
#'
#' ## retrieves a list of active activity input requests
#' r <- fac_get_users_activity_input_request()
#' content(r)
#'
#' ## retrieves a list of tenant IDs and is_institutional_admin flag
#' r <- fac_get_users_current()
#' content(r)
#' }
#'
#' @note API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/Users}
NULL

#' @rdname users
#' @export
fac_get_users <- function(unitid,
                          employmentstatus = c("All", "Full Time", "Part Time", "Staff", "Inactive", "All Active"),
                          data = c("count", "summary", "detailed"),
                          q,
                          limit,
                          offset,
                          ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/users", query, ...)
}

#' @rdname users
#' @export
fac_get_user <- function(userid,
                         extra = c("accounttype", "suffix", "honorific", "officebuilding", "officenumber", "phone", "gender", "race", "nationality", "homephone", "homestreet1", "homestreet2", "homecity", "homestate", "homezipcode", "cellphone", "teachinginterest", "researchinterest", "rankname", "biography", "emergencycontact", "emergencycontactphone", "pager", "personalstreet1", "personalstreet2", "personalcity", "personalstate", "personalzip", "url"),
                         data = c("count", "summary", "detailed"),
                         q,
                         limit,
                         offset,
                         ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, "userid")
  fac_get(paste0("/users/", userid), query, ...)
}

#' @rdname users
#' @export
fac_get_users_activity_input_request <- function() {
  fac_get("/users/activity_input_request", host = "https://faculty180.interfolio.com")
}

#' @rdname users
#' @export
fac_get_users_current <- function() {
  fac_get("/users/current", host = "https://faculty180.interfolio.com")
}
