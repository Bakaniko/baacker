#' create_unique_id
#' create unique id for dataframe
#' with Num_Acc and num_veh columns
#'
#' vhc_id identifies the vehicule in the accident
#'
#' @param df A dataframe
#' @return A dataframe with a new vhc_id id
#' @examples
#'   df <- tibble::tribble(
#'      ~Num_Acc,   ~num_veh,
#'      "xxx", "A01",
#'      "yyyy", "B01",
#'      )
#' create_unique_id(df)
#' @export
#'
create_unique_id <- function(df){
  require(dplyr)

  if ("num_veh" %in% names(df)) {
    #create vhc_id which is concatenation of accident id and vehicule id
    return(df %>% dplyr::mutate(vhc_id = paste0(Num_Acc, "-", num_veh)))
  }

  else{ # if no num_veh variable, return the df intact
    return(df)
  }
}
