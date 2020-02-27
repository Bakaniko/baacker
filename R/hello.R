# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

### Variables
first_name <- "Nicolas"
last_name <- "Roelandt"
email <- "nicolas.roelandt@univ-gustave-eiffel.fr"
github_handler <- "Bakaniko"
dev_history_file <- "devhistory"

init_data_raw <- function(name = "devhistory"){
  attempt::stop_if_not(name, is.character, "Please use a character vector")
  usethis::use_data_raw()

  new_file_path <- glue::glue({here::here()}, "/data-raw/{name}.R")
  file.create(new_file_path)
  file.edit(new_file_path)
}
init_data_raw()

init_docs <- function(name = glue::glue("{first_name} {last_name}")){
  stop_if_not(name, is.character, "Please use a character vector")
  use_mit_license(name)
  use_readme_rmd()
  use_news_md()
  use_testthat()
}

fill_desc <- function(name, Title, Description, repo){
  unlink("DESCRIPTION")
  my_desc <- desc::description$new("!new")
  my_desc$set("Package", name)
  my_desc$set("Authors@R", "person('Nicolas', 'Roelandt', email = 'nicolas.roelandt@univ-', role = c('cre', 'aut'))")
  my_desc$del("Maintainer")
  my_desc$set_version("0.0.0.9000")
  my_desc$set(Title = Title)
  my_desc$set(Description = Description)
  my_desc$set("URL", glue("https://github.com/Bakaniko/{repo}"))
  my_desc$set("BugReports", glue("https://github.com/Bakaniko/{repo}/issues"))
  my_desc$write(file = "DESCRIPTION")
}


fill_desc_generic <- function(name, Title, Description = "Here", repo,
                              first_name = "Nicolas",
                              last_name = "Roelandt",
                              github_user = "NicolasRoelandt",
                              email = email,
                              role = "c('cre', 'aut')",
                              version = "0.0.0.9000"){
  unlink("DESCRIPTION")
  my_desc <- desc::description$new("!new")
  my_desc$set("Package", name)
  my_desc$set("Authors@R",
              glue("person('{first_name}', '{last_name}', email = '{email}', role = {role}"))
  my_desc$del("Maintainer")
  my_desc$set_version(version)
  my_desc$set(Title = Title)
  my_desc$set(Description = Description)
  my_desc$set("URL", glue("https://github.com/{github_user}/{repo}"))
  my_desc$set("BugReports", glue("https://github.com/{github_user}/{repo}/issues"))
  my_desc$write(file = "DESCRIPTION")
}
