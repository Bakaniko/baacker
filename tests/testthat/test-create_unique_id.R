test_that("create_unique_id works", {

  df <- tibble::tribble(
    ~Num_Acc,   ~num_veh,
    "xxx", "A01",
    "yyyy", "B01",
  )

  expected_output <- tibble::tribble(
    ~Num_Acc,   ~num_veh, ~vhc_id,
    "xxx", "A01","xxx-A01",
    "yyyy", "B01","yyyy-B01",
  )
  expect_equal(create_unique_id(df), expected_output)
})


test_that("create_unique_id does not modify dataframes without num_veh column", {

  df <- tibble::tribble(
    ~Num_Acc,   ~place,
    "xxx", "A01",
    "yyyy", "B01",
  )

  expected_output <- tibble::tribble(
    ~Num_Acc,   ~place,
    "xxx", "A01",
    "yyyy", "B01",
  )
  expect_equal(create_unique_id(df), expected_output)
})


