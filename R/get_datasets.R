#' get_datasets
#' Get BAAC datasets from data.gouv.fr
#'
#' @param year Vector of years to download
#' @return List of datasets or the load datasets for specific years
#' @examples
#' get_datasets()
#' get_datasets(2018)
#' get_datasets(2016:2018)
#' @export

get_datasets <- function( year = NA) {
  require(rvest)
  require(tidyverse)
  require(stringr)

  datasets_url <- xml2::read_html("https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/#_")

  # File names
  filenames <- datasets_url %>% rvest::html_nodes(".ellipsis") %>%
    rvest::html_text()

  # file urls
  urls <- datasets_url %>% rvest::html_nodes("a.btn-primary") %>%
    rvest::html_attr("href")

  ## Remove NAs
  urls <- urls[!is.na(urls)]

  stopifnot(length(filenames) == length(urls))

  # Build dataset
  baac_datasets <- tibble(
     filename = filenames,
     url = urls
     ) %>% filter(grepl(".csv", filename)) %>%# filter non CSV files
    mutate(year = # extract year
                 stringr::str_sub(
                   filename,
                   start = -8, end = -5)
             )
  if (is.na(year)) {
    return(baac_datasets)
  }

}
