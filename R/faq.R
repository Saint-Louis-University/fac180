#' FAQ
#'
#' @name faq
#'
#' @description Retrieves frequently asked questions.
#'
#' @param pending logical
#' When true, only pending FAQ items that are unanswered will be returned.
#' Only available for * institutional administrators.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' ## get faq
#' r <- fac_get_faq()
#' content(r)
#'
#' @note API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/FAQ}
NULL

#' @rdname faq
#' @export
fac_get_faq <- function(pending,
                        ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args)
  fac_get("/faq", query, ..., host = "http://faculty180.interfolio.com")
}
