## code to prepare `DATASET` dataset goes here

# usethis::use_data("DATASET")
library(fs)
library(purrr)
library(here)
library(vroom)


## parameters
number_of_lines <- 10
# With 2018 datasets urls
vehicules_url <- "https://www.data.gouv.fr/fr/datasets/r/b4aaeede-1a80-4d76-8f97-543dad479167"
usagers_url <- "https://www.data.gouv.fr/fr/datasets/r/72b251e1-d5e1-4c46-a1c2-c65f1b26549a"
lieux_url <- "https://www.data.gouv.fr/fr/datasets/r/d9d65ca1-16a3-4ea3-b7c8-2412c92b69d9"
caracteristiques_url <- "https://www.data.gouv.fr/fr/datasets/r/6eee0852-cbd7-447e-bd70-37c433029405"

url <- c(vehicules_url,usagers_url,lieux_url,caracteristiques_url)
name <- c("vehicules","usagers","lieux","caracteristiques")

# Create dataframe with urls and file names
df <- as.data.frame(cbind(name, url), stringsAsFactors = FALSE)

# Download and rename each file => problem with certain files
purrr::pmap(df, function(name,url) {
  print(paste0("Reading ",name,'.csv'))
  vroom::vroom(url, # reading the remote file
               delim=",",
               col_types = c(.default = "c")) %>% # convert all variables to characters
    head(n = number_of_lines) %>%
    # write file in data-raw folder
    vroom::vroom_write(here::here('data-raw',paste0(name,'.csv')),  delim = ",")
}  )


