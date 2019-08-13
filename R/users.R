#' Create, update and retrieve details of users.
#'
#' @name users
#'
#' @description Retrieve details on users within your institution. A count of users will be returned if no parameters are specified.
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
#' ## get count of users
#' r <- fac_get_users()
#' content(r)
#'
#' ## get details of users in unit 3
#' r <- fac_get_users(unitid = "3", data = "detailed")
#' content(r)
#'
#' ## get summary of all full time in units 3 and 4
#' r <- fac_get_users(unitid = "3,4", employmentstatus = "Full Time", data = "summary")
#' content(r)
#'
#' ## get summary of user "000187846"
#' r <- fac_get_user(userid = "000187846", data = "summary")
#' content(r)
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
