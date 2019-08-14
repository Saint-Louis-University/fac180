#' Activities
#'
#' @name activities
#'
#' @description Retrieve details of Activities.
#'
#' @param unitid integer
#' retrieve details of a unit with unitid
#' When defined, activities are limited to users whose primary unit matches the specified unit.
#' When undefined, all activities are returned.
#' @param sectionid integer
#' Retrieve activities within a sectionid
#' When defined, limits the activities to only the specified section.
#' When undefined, all sections are returned.
#' @param userlist comma separated vector of string
#' Values should match the userid of users.
#' When defined, filter returned data to the specified users.
#' When undefined, all users are returned.
#' @param activityclassificationfilter comma seperated vector of string
#' When multiple items are specified, queries are constructed using AND.
#' When defined, activities are filtered to those with the specified choice for the specified activity classification.
#' When undefined, activities are not filtered by activity classifications.
#' The activityclassificationidid and activityclassificationchoicevalue are returned by the Activity Classification Details resource in “detailed” output.
#' @param termstart string
#' Value should match the termid of terms.
#' When defined, limits classification data to the specified starting term.
#' When undefined, defaults to the current term.
#' @param termfinish string
#' Value should match the termid of terms.
#' When defined, limits classification data to the specified ending term.
#' When undefined, defaults to the current term.
#' @param includeJournalMetrics integer
#' Includes Journal Metrics when data=detailed.
#' Allowed values are: \* 1 - Show \* 0 - (default) Do not show
#' @param showhidden integer
#' Tells the API whether it should respect the 'Publicly Displayed' activity classification in the activity data set that is output.
#' Allowed values are:
#' 1 - (default) The 'Publicly Displayed' activity classification is ignored and those activities that a faculty member requested hidden ARE shown, or
#' 0 - The 'Publicly Displayed' activity classification is honored and those activities that a faculty member requested hidden ARE NOT shown.
#' @param activityclassificationpull comma separated vector of integer
#' When defined, returned data includes activity classification values for the specified activity classifications.
#' When undefined, no activity classification data is included.
#' @param type string
#' Value should match the exact name of a Scholarly Activity and Creative Productions sub-type
#' When defined, limits activities matched to the specified scholarly activity sub-type
#' (Note this parameter ONLY applies to records retrieved from sectionid=-21 (i.e. 'Scholarly Activities and Creative Productions'). It is ignored for activities pulled from any other section.
#' @param page integer
#' Combines with the limit parameter and used to pull a given page of activities.
#' @param last_updated string
#' Determines the exact date of when an activity was last updated.
#' Accepted format is YYYY-MM-DD
#' When provided,the returned activities are limited to those modified on the provided date
#' @param activityid integer
#' Retrieve an activity with an activityid
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' \dontrun{
#' ## retrieves faculty activity IDs in sections
#' r <- fac_get_activities()
#' content(r)
#'
#' ## retrieves faculty activity IDs in sections
#' r <- fac_get_activities(sectionid = 5, data = "summary")
#' content(r)
#'
#' ## retrieves activities for a specified action
#' r <- fac_get_activities_section(sectionid = 5)
#' content(r)
#'
#' ## retrieves activities for a specified action
#' r <- fac_get_activities_section(sectionid = 5,
#'                                 data = "detailed",
#'                                 activityclassificationfilter = "-2,12")
#' content(r)
#'
#' ## retrieves activities details for a specified action
#' r <- fac_get_activities_section_details(sectionid = -21)
#' content(r)
#'
#' ## retrieves activities details for a specified action
#' r <- fac_get_activities_section_details(sectionid = -21,
#'                                         data = "detailed",
#'                                         activityclassificationpull = "-2,12")
#' content(r)
#'
#' ## retrieves details for a given activity
#' r <- fac_get_activities_section_details(sectionid = 5, activityid = 25)
#' content(r)
#'
#' ## retrieves details for a given activity
#' r <- fac_get_activities_section_details(sectionid = 5,
#'                                         activityid = 25,
#'                                         data = "detailed",
#'                                         activityclassificationpull = "-2,12")
#' content(r)
#'
#' ## retrieves details for a given activity attachment(s)
#' r <- fac_get_activities_section_details_attachments(sectionid = 5, activityid = 25)
#' content(r)
#'
#' ## retrieves details for a given activity attachment(s)
#' r <- fac_get_activities_section_details_attachments(sectionid = 5,
#'                                                     activityid = 25,
#'                                                     data = "detailed")
#' content(r)
#' }
#'
#' @note API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/Activities}
NULL

#' @rdname activities
#' @export
fac_get_activities <- function(unitid,
                               sectionid,
                               userlist,
                               activityclassificationfilter,
                               termstart,
                               termfinish,
                               includeJournalMetrics = seq(0, 1, 1),
                               showhidden = seq(1, 0, -1),
                               data = c("count", "summary", "detailed"),
                               q,
                               limit,
                               offset,
                               ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/activities", query, ...)
}

#' @rdname activities
#' @export
fac_get_activities_section <- function(sectionid,
                                       unitid,
                                       userlist,
                                       activityclassificationfilter,
                                       activityclassificationpull,
                                       termstart,
                                       termfinish,
                                       type,
                                       data = c("count", "summary", "detailed"),
                                       q,
                                       limit,
                                       offset,
                                       ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, "sectionid")
  fac_get(paste0("/activities/", sectionid), query, ...)
}

#' @rdname activities
#' @export
fac_get_activities_section_details <- function(sectionid,
                                               unitid,
                                               userlist,
                                               activityclassificationfilter,
                                               activityclassificationpull,
                                               termstart,
                                               termfinish,
                                               page,
                                               last_updated,
                                               data = c("count", "summary", "detailed"),
                                               q,
                                               limit,
                                               offset,
                                               ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, "sectionid")
  fac_get(paste0("/activities/-", sectionid), query, ...)
}

#' @rdname activities
#' @export
fac_get_activity_section_details <- function(sectionid,
                                             activityid,
                                             activityclassificationpull,
                                             data = c("count", "summary", "detailed"),
                                             q,
                                             limit,
                                             offset,
                                             ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, c("sectionid", "activityid"))
  fac_get(paste("/activities", sectionid, activityid, sep = "/"), query, ...)
}

#' @rdname activities
#' @export
fac_get_activity_section_details_attachments <- function(sectionid,
                                                         activityid,
                                                         data = c("count", "summary", "detailed"),
                                                         q,
                                                         limit,
                                                         offset,
                                                         ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, c("sectionid", "activityid"))
  fac_get(paste("/activities", sectionid, activityid, "attachments", sep = "/"), query, ...)
}
