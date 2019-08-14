#' Download Attachments
#'
#' @name download_attachments
#'
#' @description Retrieves an attachment.
#'
#' @param attachmentid integer
#' Retrieves an attachment.
#' @inheritParams fac_get
#'
#' @return a \code{\link[httr]{response}} object
#'
#' @examples
#' \dontrun{
#' ## retrieves an attachment
#' r <- fac_get_download_attachments(attachmentid = 100)
#' content(r)
#' }
#'
#' @note API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/Download-Attachments}
NULL

#' @rdname download_attachments
#' @export
fac_get_download_attachments <- function(attachmentid,
                                         ...) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  query <- fac_build_query_list(args, "attachmentid")
  fac_get(paste0("/downloadattachments/", attachmentid), query, ...)
}
