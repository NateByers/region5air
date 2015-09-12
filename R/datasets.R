#' Air Quality Data from EPA's AirData site.
#'
#' A dataset containing hourly values of ozone, PM2.5, and temperature for the Chicago area between
#' January 1, 2013 and December 31, 2014.
#'
#' @format A data frame with 367597 rows and 20 variables:
#' \describe{
#'   \item{site}{Twelve-character field based on the three-digit ISO country code plus the nine-digit monitor location code. The nine-digit monitor location code is the AQS site identifier. It consists of a two-digit state code, a three-digit county code, and a four-digit site number without spaces between the individual codes. For example, 123456789123 = 123 (country code) + 456789123 (nine-digit monitor location code).}
#'   \item{data_status}{Status of the data. 0 = Preliminary 1 = Final. Data are denoted as final after the agency collecting and reporting the data certifies that they meet quality assurance requirements and are complete and correct in AQS. This is only required for criteria pollutants reported from state agencies.}
#'   \item{action_code}{Action code for data ingesting. Not relevant to data obtained from QAD. Always blank.}
#'   \item{datetime}{Date and time of the data value, given in the following format without spaces: YYYYMMDDThhmmTZD. Four-digit year (YYYY), two-digit month (MM), two-digit day (DD), capital letter T (time), two-digit hour (hh, in 24-hr time), two-digit minutes (mm), and the time zone designation, TZD. (The date-time field is the ISO 8601 Basic.) TZD is +hhmm/-hhmm from GMT. The time corresponds to the begin time of the sampling period.}
#'   \item{parameter}{Five-digit AQS code used to identify the parameter being monitored.}
#'   \item{duration}{Measurement (sampling) period in minutes.}
#'   \item{frequency}{How often the measurement is repeated (minutes). If measurements are taken multiple times per day (i.e., hourly), it is blank; otherwise, minutes equivalent (e.g., every day = 1440, and every other day = 2880).}
#'   \item{value}{Data (sampled) value of the specified parameter.}
#'   \item{unit}{Three-digit AQS code used to describe the units in the measurement of the specified parameter.}
#'   \item{qc}{The AIRNow code used to link to the quality control codes that describe the validity, invalidity, or questionable status of the measurement.}
#'   \item{poc}{The "parameter occurrence code" (POC). The POC is used to specify if more than one monitor is measuring the same parameter at the same site. For example, if there are two ozone monitors at a site, they would have different POCs.}
#'   \item{lat}{Latitude in decimal degrees of the monitor. Latitudes north of the Equator are positive and latitudes south of the Equator are negative.}
#'   \item{lon}{Longitude in decimal degrees of the monitor. Longitudes west of the Prime Meridian are negative and longitudes east of the Prime Meridian are positive.}
#'   \item{GISDatum}{The datum associated with the latitude and longitude measurements.}
#'   \item{elev}{Elevation of the monitor in meters above mean sea level (MSL).}
#'   \item{method_code}{Three-digit AQS code that identifies the method used to perform the measurement.}
#'   \item{mpc}{Measurement Performance Characteristic (MPC) is a performance measurement for the measurement taken. The only valid value for QAD responses is "MDL" meaning method (lower) detection limit.}
#'   \item{mpc_value}{The value for the mpc (MDL) in the same units as the sample.}
#'   \item{uncertainty}{Uncertainty needs to be in the same units as the specified parameter and is given using the 95\% confidence level.}
#'   \item{qualifiers}{AQS qualifier code(s) separated by spaces. Qualifiers indicate whether the data have been flagged by the submitter and the reason the sample was so flagged.}
#' }
#' @source \url{https://ofmext.epa.gov/AQDMRS/aqdmrs.html}
"airdata"


#' Air quality data from a Chicago monitor.
#'
#' A dataset containing daily values of ozone, temperature, and solar radiation from a Chicago monitor between
#' January 1, 2013 and December 31, 2013.
#'
#' @format A data frame with 730 rows and 6 variables:
#' \describe{
#'   \item{date}{Year-Month-Day}
#'   \item{ozone}{8-hour maximum value in ppm}
#'   \item{temp}{1-hour maximum value in degrees Fahrenheit}
#'   \item{solar}{1-hour maximum value in Langleys/minute}
#'   \item{month}{Month (1-12)}
#'   \item{weekday}{Day of week (1-7)}
#' }
#' @details These are measurements from a monitor with EPA AQS code 840170314201 at latitude 42.14 and longitude -87.79923,
#' datum WGS84.
#' @source \url{https://ofmext.epa.gov/AQDMRS/aqdmrs.html}
"chicago_air"

#' Wind data from a Chicago monitor.
#'
#' A dataset containing hourly values of wind speed, wind direction, and ozone concentration from a Chicago monitor between
#' January 1, 2013 and December 31, 2013.
#'
#' @format A data frame with 8643 rows and 4 variables:
#' \describe{
#'   \item{datetime}{Date and time of the data value, given in the following format without spaces: YYYYMMDDThhmmTZD. Four-digit year (YYYY), two-digit month (MM), two-digit day (DD), capital letter T (time), two-digit hour (hh, in 24-hr time), two-digit minutes (mm), and the time zone designation, TZD. (The date-time field is the ISO 8601 Basic.) TZD is +hhmm/-hhmm from GMT. The time corresponds to the begin time of the sampling period.}
#'   \item{wind_speed}{1-hour resultant value in knots}
#'   \item{wind_dir}{1-hour resultant wind direction in degrees compass}
#'   \item{ozone}{1-hour value in ppm}
#' }
#' @details These are measurements from a monitor with EPA AQS code 840170310001 at latitude 41.67099 and longitude -87.73246,
#' datum WGS84.
#' @source \url{https://ofmext.epa.gov/AQDMRS/aqdmrs.html}
"chicago_wind"
