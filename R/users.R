#' Users
#'
#' @description Create, update, and retreive details of users.
#'
#' @param unitid string: comma separated vector of integers - retrieve users in units with specific ids.
#' @param userid string: id of a specific user.
#' @param employmentstatus string - users are filtered by their employment status.
#' @param extra string: comma seperated vector of string - when included, additional details are indexed and included in the returned array.
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
<<<<<<< HEAD
#' ## get summary of user "000187846"
#' r <- fac_get_user(userid = "000187846", data = "summary")
=======
#' ## get summary of user "000315149"
#' r <- fac_get_user(userid = "000315149", data = "summary")
>>>>>>> d2ca1ef14f22f4b27ba9059522299629b67558d7
#' content(r)
#' @name users
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
  query <- args[c("unitid", "employmentstatus", "data", "q", "limit", "offset")]
  fac_get("/users", query, ...)
}

#' @rdname users
#' @export
fac_get_user <- function(userid,
                         data = c("count", "summary", "detailed"),
                         extra = c("accounttype", "suffix", "honorific", "officebuilding", "officenumber", "phone", "gender", "race", "nationality", "homephone", "homestreet1", "homestreet2", "homecity", "homestate", "homezipcode", "cellphone", "teachinginterest", "researchinterest", "rankname", "biography", "emergencycontact", "emergencycontactphone", "pager", "personalstreet1", "personalstreet2", "personalcity", "personalstate", "personalzip", "url"),
                         q,
                         limit,
                         offset,
                         ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- args[c("extra", "data", "q", "limit", "offset")]
  fac_get(paste0("/users/", userid), query, ...)
}
