test_that("get_raw_datasets works with one year", {

  # test OK if there is 4 files with the correct size

  temp_dir <- tempdir()
  get_raw_datasets(year = "2018", path = tempdir())

  files <- list.files(path = temp_dir, pattern = ".csv")

  file_size <- tibble::tribble(
    ~file,   ~size,
    "caracteristiques-2018.csv", 4696158,
    "lieux-2018.csv", 2838996,
    "usagers-2018.csv", 5403979,
    "vehicules-2018.csv", 3756297
  )
  # Test if the downloaded files has the expected size
  expect_equal(
  fs::dir_info(temp_dir, glob = "*.csv") %>%
    dplyr::transmute(file = basename(path), size = as.numeric(size)),
  file_size)
})


test_that("get_raw_datasets works with a numeric vector", {

  temp_dir <- tempdir()
  get_raw_datasets(year = c(2018, 2016), path = tempdir())

  files <- list.files(path = temp_dir, pattern = ".csv")

  files <- tibble::tribble(
    ~file,   ~size,
    "caracteristiques-2018.csv", 4696158,
    "caracteristiques_2016.csv", 4616433,
    "lieux-2018.csv", 2838996,
    "lieux_2016.csv", 3148830,
    "usagers-2018.csv", 5403979,
    "usagers_2016.csv", 5705950,
    "vehicules-2018.csv", 3756297,
    "vehicules_2016.csv", 3872943
  )
  # Test if the downloaded files has the expected size
  expect_equal(
    fs::dir_info(temp_dir, glob = "*.csv") %>%
      dplyr::transmute(file = basename(path), size = as.numeric(size)),
    files)
})



