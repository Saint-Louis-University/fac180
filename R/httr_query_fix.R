test <- function(a, b, c) {
  args <- lapply(as.list(match.call())[-1], eval.parent)
  httr::GET("http://httpbin.org/anything", query = args)
}
t <- "1,2,3"
response <- test("1,2,3", t, paste(1:3, collapse = ","))
response$url
