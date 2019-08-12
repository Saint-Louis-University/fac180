#' Permissions
#'
#' @description Retrieve details of users' permissions.
#'
#' @param userlist string: comma separated vector of users - limits the bulk GET to the users in the list.
#' @param rights string - when set to "1" will report only users with Full Admin Rights. When set to "2" will report only users with Report Rights. Defaults to "1,2".
#' @param unitid string: comma separated vector of integers - only return permissions for selected units.
#' @param userid string: id of a specific user
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## TODO
#' @name permissions
NULL

#' @rdname permissions
#' @export
fac_get_users_permissions <- function(userlist,
                                      rights = c("1,2", "1", "2"),
                                      unitid,
                                      data,
                                      q,
                                      limit,
                                      offset,
                                      ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- args[c("userlist", "rights", "unitid", "data", "q", "limit", "offset")]
  fac_get("/permissions", query, ...)
}

#' @rdname permissions
#' @export
fac_get_user_permissions <- function(userid,
                                     rights,
                                     unitid,
                                     data,
                                     q,
                                     limit,
                                     offset,
                                     ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- args[c("rights", "unitid", "data", "q", "limit", "offset")]
  fac_get(paste0("/permissions/", userid), query, ...)
}
