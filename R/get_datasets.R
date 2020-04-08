#' get_datasets
#' Get BAAC datasets from data.gouv.fr
#'
#' @param years Vector of years to download
#' @return List of all available datasets if empty or filtered on years in a numeric vector
#' @examples
#' get_datasets()
#' get_datasets(2018)
#' get_datasets(2016:2018)
#' @export

get_datasets <- function( years = NA) {
  require(rvest)
  require(dplyr)
  require(stringr)
  require(attempt)

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
  if (is.na(years)) {
    return(baac_datasets)
  }

  if (!is.na(years)) {

     years <- try_catch(expr = as.numeric(years),
              .e = ~ paste0("There is an error: ", .x),
              .w = ~ paste0("This is a warning: ", .x))
     stop_if_not(
       is.numeric(years),
       msg = "Year(s) should be in a numeric vector"
     )

    return(baac_datasets %>% filter(year %in% years))
  }

}

#' Get BAAC csv files from data.gouv.fr to a specified folder
#'
#' @param years Vector of years to download
#' @param path  Folder where to put the csv files
#' @return File list and path to them
#' @examples
#' get_raw_datasets(2018, tempdir())
#' get_raw_datasets(2016:2018, tempdir())
#' @export
get_raw_datasets <- function(years, path) {
  require(purrr)
  require(dplyr)

  if(missing(path)){
    path <- tempdir()
  }


  files_urls <- baacker::get_datasets(years)
  files_urls <- files_urls %>%
    mutate(path = paste0(path, '/', filename))

  map2(files_urls[["url"]], files_urls[["path"]], ~ download.file(url = .x, destfile = .y))

  file_list <- list.files(path = path, pattern = ".csv", full.names = TRUE)
  return(file_list)
}
