#' Activity Input
#'
#' @name activity_input
#'
#' @description Retrieves activity input
#'
#' @param approval_id integer
#' Specify the approval process to lookup.
#' @param faculty_id integer
#' Specify the facultyid of the user.
#' @param formName string
#' Specify the name of the form to lookup.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @note API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/Activity-Input}
NULL

#' @rdname activity_input
#' @export
fac_get_activity_input_approval_status <- function(approval_id,
                                                   faculty_id,
                                                   ...) {
  fac_get(paste("/activity_input", approval_id, faculty_id, sep = "/"), ...)
}

#' @rdname activity_input
#' @export
fac_get_activity_input_form_name_units <- function(formName,
                                                   ...) {
  fac_get(paste0("/activity_input/form_name_units/", formName), ...)
}
