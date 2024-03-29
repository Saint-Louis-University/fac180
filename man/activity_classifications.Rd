% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/activity_classifications.R
\name{activity_classifications}
\alias{activity_classifications}
\alias{fac_get_activity_classifications}
\alias{fac_get_activity_classification}
\title{Activity Classifications}
\usage{
fac_get_activity_classifications(unitid, data = c("count", "summary",
  "detailed"), q, limit, offset, ...)

fac_get_activity_classification(activityclassificationid,
  data = c("count", "summary", "detailed"), q, limit, offset, ...)
}
\arguments{
\item{unitid}{integer
Retrieve an Activity Classification with a specific unitid.
When defined, filter classifications to the specified unit.
When undefined, filters classifications from the highest unit accessible.}

\item{data}{string
Determines the extent of data that will be returned.
Count: Returns count of all activities found.
Summary: Returns an array of sections and counts of activities within that section.
Detailed: Returns an array of sections and a subarray of activityids for each section.}

\item{q}{string
Search term. Use '*' as wildcard.}

\item{limit}{integer
Limit query to specified number of records.}

\item{offset}{integer
Used with limit to return records in batches, e.g., if limit = 20 and offset = 21, records 21-40 will be returned.}

\item{...}{additional arguments passed to \code{\link[httr]{GET}}.}

\item{activityclassificationid}{integer
Retrieves a specific Activity Classification based on the activityclassificationid.}
}
\value{
a \code{\link[httr]{response}} object
}
\description{
Retrieves details regarding activity classifications.
}
\note{
API documentation \url{https://faculty180.interfolio.com/swagger/ui/#tag/Activity-Classifications}
}
\examples{
\dontrun{
## retrieves details regarding activity classifications
r <- fac_get_activity_classifications(data = "detailed")
content(r)

## retrieves details regarding activity classifications
r <- fac_get_activity_classifications(activityclassificationid = 18, data = "detailed")
content(r)
}

}
