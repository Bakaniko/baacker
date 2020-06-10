# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

# Init package
### Variables
package_name <- "baacker"
package_title <- "Handle BAAC file"
package_desc <- "Help to handle BAAC (French corporal accident database) and extract data"
first_name <- "Nicolas"
last_name <- "Roelandt"
email <- "nicolas.roelandt@univ-gustave-eiffel.fr"
github_handler <- "Bakaniko"
dev_history_file <- "devhistory"
person_comment <- c(ORCID = "0000-0001-9698-4275")


### packages
library(attempt)
library(usethis)
library(glue)
library(here)


init_data_raw <- function(name = "devhistory"){
  attempt::stop_if_not(name, is.character, "Please use a character vector")
  usethis::use_data_raw()

  new_file_path <- glue::glue({here::here()}, "/data-raw/{name}.R")
  file.create(new_file_path)
  file.edit(new_file_path)
}
init_data_raw(name =  dev_history_file)

init_docs <- function(name = "Nicolas Roelandt"){
  attempt::stop_if_not(name, is.character, "Please use a character vector")
  usethis::use_mit_license(name)
  usethis::use_readme_rmd()
  usethis::use_news_md()
  usethis::use_testthat()
}

init_docs(name = glue::glue("Univ Gustave Eiffel"))

fill_desc <- function(name, Title, Description,first_name, last_name, github_handler, repo, email, comment){
  unlink("DESCRIPTION")
  my_desc <- desc::description$new("!new")
  my_desc$set("Package", name)
  my_desc$set("Authors@R", glue::glue("person(given = {first_name}, family = {last_name}, email = {email}, role = c('cre', 'aut'))"))
  my_desc$del("Maintainer")
  my_desc$set_version("0.0.0.9000")
  my_desc$set(Title = Title)
  my_desc$set(Description = Description)
  my_desc$set("URL", glue::glue("https://github.com/{github_handler}/{repo}"))
  my_desc$set("BugReports", glue::glue("https://github.com/{github_handler}/{repo}/issues"))
  my_desc$write(file = "DESCRIPTION")
}

fill_desc(
  name =package_name,
  Title = package_title,
  Description = package_desc,
  first_name,
  last_name,
  github_handler,
  repo = package_name,
  email)

fill_desc_generic <- function(name, Title, Description = "Here", repo,
                              first_name = "Nicolas",
                              last_name = "Roelandt",
                              github_user = "BakaNiko",
                              email = email,
                              role = "c('cre', 'aut')",
                              version = "0.0.0.9000",
                              comment = ''){
  unlink("DESCRIPTION")
  my_desc <- desc::description$new("!new")
  my_desc$set("Package", name)
  my_desc$set("Authors@R",
              glue::glue("person('{first_name}', '{last_name}', email = '{email}', role = {role}, comment = '{comment}')"))
  my_desc$del("Maintainer")
  my_desc$set_version(version)
  my_desc$set(Title = Title)
  my_desc$set(Description = Description)
  my_desc$set("URL", glue::glue("https://github.com/{github_user}/{repo}"))
  my_desc$set("BugReports", glue::glue("https://github.com/{github_user}/{repo}/issues"))
  my_desc$write(file = "DESCRIPTION")
}

fill_desc_generic(name = package_name,
                  Title = package_title,
                  Description = package_desc,
                  repo = package_name,
                  first_name = first_name,
                  last_name = last_name,
                  github_user = github_handler,
                  email = email,
                  comment = person_comment)
## Produce logo
imgurl <- here::here("figures/bread.png")

hexSticker::sticker(imgurl,
                    package="baacker",
                    p_size=22,
                    s_x=1.05,
                    s_y=0.75,
                    s_width=.5,
                    h_fill="#ffcc66",
                    h_color="#ffffff",
                    filename=here::here("inst/figures/imgfile.png"))

usethis::use_code_of_conduct()

usethis::use_data(baac_codage) # voir DATASET.R
devtools::build_readme()
usethis::use_package("stringr")
usethis::use_package("rvest")
usethis::use_test("get_datasets")
usethis::use_package("httr")
usethis::use_package("dplyr")
usethis::use_package("purrr")
usethis::use_test("get_raw_datasets")

usethis::use_r(name = "get_data")
usethis::use_test("get_data")

devtools::document()

# check dependencies
library(dplyr)
library("itdepends")
package <- "baacker"
itdepends::dep_usage_pkg(package) %>%
  count(pkg, sort = TRUE)

itdepends::dep_usage_pkg(package) %>%
  group_by(pkg) %>%
  count(fun) %>%
  top_n(1) %>%
  arrange(desc(n)) %>%
  head()


# TODO join all files in a dataframe
usethis::use_package("attempt")



