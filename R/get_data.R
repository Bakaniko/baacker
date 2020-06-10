#' get_data
#' Get BAAC data in a R format
#'
#' @param years Vector of years to download, by default 2018
#' @return A dataframe containing the BAAC data for requested years
#' @examples
#' get_data(2018)
#' get_data(2016:2018)
#' @export

get_data <- function( years = 2018) {
  files <- baacker::get_raw_datasets(years)
  return(files)

}
