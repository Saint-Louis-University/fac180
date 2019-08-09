#' Faculty180 API Credentials
#'
#' @description Helper function to retrieve HMAC credentials.
#'
#' @param public_key string - public key
#' @param private_key string - private key
#' @param database_id string - database id
#' @param host string - base url
#'
#' @return named list of credentials
#' @export
#'
#' @examples
#' fac_credentials()
fac_credentials <- function(public_key = Sys.getenv("FAC180_DEV_PK"),
                            private_key = Sys.getenv("FAC180_DEV_SK"),
                            database_id = Sys.getenv("FAC180_DEV_DB"),
                            host = Sys.getenv("FAC180_BASE_URL")) {
  list(public_key = public_key,
       private_key = private_key,
       database_id = database_id,
       host = host)
}

#' Faculty180 GET
#'
#' @description Base function to perform any HMAC GET request.
#'
#' @param request_string string - api endpoint to call
#' @param query named list - passed to \code{\link[httr]{modify_url}} to build query strings
#' @param credentials function - returns named list of credentials. See \code{\link{fac_credentials}}
#'
#' @return
#' @export
#'
#' @examples
#' response <- fac_get("/units")
#' httr::content(response)
fac_get <- function(request_string,
                    query = list(),
                    credentials = fac_credentials()) {
  request_verb <- "GET"
  timestamp_string <- format(as.POSIXlt(Sys.time(), "UTC"), "%Y-%m-%d %H:%M:%S")
  verb_request_string <- paste(request_verb, "\n",  timestamp_string, request_string, sep = "\n")
  signed_hash <- httr::hmac_sha1(credentials$private_key, verb_request_string)
  authorization_header = paste0("INTF ", credentials$public_key, ":", signed_hash)
  url <- paste0(credentials$host, request_string)
  config <- httr::add_headers("TimeStamp" = timestamp_string,
                              "Authorization" = authorization_header,
                              "INTF-DatabaseID" = credentials$database_id)
  httr::GET(url, config, query = query)
}
