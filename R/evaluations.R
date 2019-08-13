#' Evaluations
#'
#' @name evaluations
#'
#' @description Retrieve details of users' evaluations.
#'
#' @param unitid integer
#' Retrieve an Activity Classification with a specific unitid.
#' When defined, filter classifications to the specified unit.
#' When undefined, filters classifications from the highest unit accessible.
#' @param title string
#' The title assigned to the evaluation
#' @param process_id integer
#' The process id associated with the evaluation process in which the evaluation resides.
#' @param unit_id integer
#' The unit id associated with the unit in which the evaluation resides.
#' @param self_evaluation logical
#' When true, the serach will be limited to self_evaluations.
#' @param template_flag integer
#' Retrieve evaluations that are not templates by using 0. Evaluations that are templates * with a value of 1, or evaluations that are workflow templates with a value of 2.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## get count of evaluations
#' r <- fac_get_evaluations(unitid = 1)
#' content(r)
#'
#' @note API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/Evaluations}
NULL

#' @rdname evaluations
#' @export
fac_get_evaluations <- function(unitid,
                                data = c("count", "summary", "detailed"),
                                q,
                                limit,
                                offset,
                                ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/evaluations", query, ...)
}

#' @rdname evaluations
#' @export
fac_get_evaluations_search <- function(title,
                                       process_id,
                                       unit_id,
                                       self_evaluation,
                                       template_flag = seq(0, 2, 1),
                                       ...) {
  template_flag <- match.arg(template_flag)
  query <- list(title = title,
                process_id = process_id,
                unit_id = unit_id,
                self_evaluation = self_evaluation,
                template_flag = template_flag)
  fac_get("/evaluations/search", query, ...)
}
