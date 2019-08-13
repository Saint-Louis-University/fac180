#' @importFrom httr content
#' @export
httr::content

#' Build Query List
#'
#' @param call_args named list
#' Argument names and values that were passed in the original call.
#' @param path_args string vector
#' Names of arguments to remove due to use in the API path.
#' @param httr_args string vector
#' Names of arguments to remove due to being passed to \code{\link[httr]{GET}}
#'
#' @return named list of query strings to pass to \code{\link[httr]{GET}}
#'
#' @examples
#' \dontrun{
#' call_args <- lapply(as.list(match.call())[-1], eval.parent)
#' query <- fac_build_query_list(call_args, "an_api_path_arg", "...")
#' }
fac_build_query_list <- function(call_args, path_args = NULL, httr_args = "...") {
  calling_function_formal_names <- names(formals(eval(as.list(sys.call(-1))[[1]])))
  all_possible_query_arg_names <- setdiff(calling_function_formal_names,
                                          c(path_args, httr_args))
  defined_query_arg_names <- intersect(all_possible_query_arg_names, names(call_args))
  call_args[defined_query_arg_names]
}

#' Faculty180 API Credentials
#'
#' @description Helper function to retrieve HMAC credentials.
#'
#' @param public_key string
#' Public key for HMAC encryption
#' @param private_key string
#' Private key for HMAC encryption
#' @param database_id string
#' Database ID to connect to
#'
#' @return named list of credentials
#' @export
#'
#' @examples
#' fac_credentials()
fac_credentials <- function(public_key = Sys.getenv("FAC180_DEV_PK"),
                            private_key = Sys.getenv("FAC180_DEV_SK"),
                            database_id = Sys.getenv("FAC180_DEV_DB")) {
  list(public_key = public_key,
       private_key = private_key,
       database_id = database_id)
}

#' Faculty180 GET
#'
#' @description Base function to perform any HMAC GET request.
#'
#' @param request_string string
#' API endpoint to call
#' @param query named list
#' Passed to \code{\link[httr]{modify_url}} to build query strings.
#' @param ... additional arguments passed to \code{\link[httr]{GET}}.
#' @param host string
#' Host url
#' @param credentials function
#' Returns named list of credentials. See \code{\link{fac_credentials}}
#' @param data string
#' Determines the extent of data that will be returned.
#' Count: Returns count of all activities found.
#' Summary: Returns an array of sections and counts of activities within that section.
#' Detailed: Returns an array of sections and a subarray of activityids for each section.
#' @param q string
#' Search term. Use '*' as wildcard.
#' @param limit integer
#' Limit query to specified number of records.
#' @param offset integer
#' Used with limit to return records in batches, e.g., if limit = 20 and offset = 21, records 21-40 will be returned.
#'
#' @return a \code{\link[httr]{response}} object
fac_get <- function(request_string,
                    query = list(),
                    ...,
                    host = Sys.getenv("FAC180_BASE_URL"),
                    credentials = fac_credentials(),
                    data = c("count", "summary", "detailed"),
                    q,
                    limit,
                    offset) {
  request_verb <- "GET"
  timestamp_string <- format(as.POSIXlt(Sys.time(), "UTC"), "%Y-%m-%d %H:%M:%S")
  verb_request_string <- paste(request_verb, "\n",  timestamp_string, request_string, sep = "\n")
  signed_hash <- httr::hmac_sha1(credentials$private_key, verb_request_string)
  authorization_header <- paste0("INTF ", credentials$public_key, ":", signed_hash)
  url <- paste0(host, request_string)
  config <- httr::add_headers("TimeStamp" = timestamp_string,
                              "Authorization" = authorization_header,
                              "INTF-DatabaseID" = credentials$database_id)
  httr::GET(url, config, query = query, ...)
}
