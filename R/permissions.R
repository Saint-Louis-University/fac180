#' Permissions
#'
#' @name permissions
#'
#' @description Retrieve details of users' permissions.
#'
#' @param userlist comma separated vector of string
#' Enter user(s) to retrieve permissions information.
#' When defined, limits the bulk GET to the users in the list.
#' When undefined, all faculty and their permissions are listed
#' @param rights string
#' Defaults to “1,2” when nothing is sent or the value is invalid.
#' When set to “1”, the system will only report users with Full Admin Rights.
#' When set to “2”, the system will only report users with Report Rights.
#' When set to “1,2” all rights will be returned.
#' @param unitid comma separated vector of integer
#' Retrieve a user with specific unitid(s).
#' When defined, only returns permissions for selected unitids.
#' When undefined, all units are selected.
#' Multiple values can be sent as a comma separated list.
#' @param userid string
#' Retrieves permission details on the specified user.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## get count of users with full admin rights
#' r <- fac_get_users_permissions(rights = "1")
#' content(r)
#'
#' ## get permissions for user "000187846"
#' # need ask interfolio
#' #r <- fac_get_user_permissions(userid = "000187846")
#' #content(r)
#'
#' @note API documentation: \url{https://faculty180.interfolio.com/swagger/ui/#tag/Permissions}
NULL

#' @rdname permissions
#' @export
fac_get_users_permissions <- function(userlist,
                                      rights = c("1,2", "1", "2"),
                                      unitid,
                                      data = c("count", "summary", "detailed"),
                                      q,
                                      limit,
                                      offset,
                                      ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/users/permissions", query, ...)
}

#' @rdname permissions
#' @export
fac_get_user_permissions <- function(userid,
                                     rights,
                                     unitid,
                                     data = c("count", "summary", "detailed"),
                                     q,
                                     limit,
                                     offset,
                                     ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, "userid")
  fac_get(paste0("/users/permissions/", userid), query, ...)
}
