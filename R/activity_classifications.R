#' Activity Classifications
#'
#' @name activity_classifications
#'
#' @description Retrieves details regarding activity classifications.
#'
#' @param unitid integer
#' Retrieve an Activity Classification with a specific unitid.
#' When defined, filter classifications to the specified unit.
#' When undefined, filters classifications from the highest unit accessible.
#' @param activityclassificationid integer
#' Retrieves a specific Activity Classification based on the activityclassificationid.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## get count of activity classifications
#' r <- fac_get_activity_classifications()
#' content(r)
#'
#' @note API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/Activity-Classifications}
NULL

#' @rdname activity_classifications
#' @export
fac_get_activity_classifications <- function(unitid,
                                             data = c("count", "summary", "detailed"),
                                             q,
                                             limit,
                                             offset,
                                             ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/activityclassifications", query, ...)
}

#' @rdname activity_classifications
#' @export
fac_get_activity_classification <- function(activityclassificationid,
                                            data = c("count", "summary", "detailed"),
                                            q,
                                            limit,
                                            offset,
                                            ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, "activityclassificationid")
  fac_get(paste0("/activityclassifications/", activityclassificationid), query, ...)
}
