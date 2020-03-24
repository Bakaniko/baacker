test_that("get_datasets() works with empty parameters", {

  output <- tibble::tribble(
    ~filename,                                                                          ~url,  ~year,
    "vehicules-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/b4aaeede-1a80-4d76-8f97-543dad479167", "2018",
    "usagers-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/72b251e1-d5e1-4c46-a1c2-c65f1b26549a", "2018",
    "lieux-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/d9d65ca1-16a3-4ea3-b7c8-2412c92b69d9", "2018",
    "caracteristiques-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/6eee0852-cbd7-447e-bd70-37c433029405", "2018",
    "vehicules-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/d6103d0c-6db5-466f-b724-91cbea521533", "2017",
    "usagers-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/07bfe612-0ad9-48ef-92d3-f5466f8465fe", "2017",
    "lieux-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/9b76a7b6-3eef-4864-b2da-1834417e305c", "2017",
    "caracteristiques-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/9a7d408b-dd72-4959-ae7d-c854ec505354", "2017",
    "vehicules_2016.csv", "https://www.data.gouv.fr/fr/datasets/r/be2191a6-a7cd-446f-a9fc-8d698688eb9e", "2016",
    "usagers_2016.csv", "https://www.data.gouv.fr/fr/datasets/r/e4c6f4fe-7c68-4a1d-9bb6-b0f1f5d45526", "2016",
    "lieux_2016.csv", "https://www.data.gouv.fr/fr/datasets/r/08b77510-39c4-4761-bf02-19457264790f", "2016",
    "caracteristiques_2016.csv", "https://www.data.gouv.fr/fr/datasets/r/96aadc9f-0b55-4e9a-a70e-c627ed97e6f7", "2016",
    "vehicules_2015.csv", "https://www.data.gouv.fr/fr/datasets/r/3420157e-7d23-4832-a710-a3a2f2df909c", "2015",
    "caracteristiques_2015.csv", "https://www.data.gouv.fr/fr/datasets/r/185fbdc7-d4c5-4522-888e-ac9550718f71", "2015",
    "lieux_2015.csv", "https://www.data.gouv.fr/fr/datasets/r/31db21ef-4328-4c5e-bf3d-66a8fe82e6a2", "2015",
    "usagers_2015.csv", "https://www.data.gouv.fr/fr/datasets/r/b43a4237-9359-4217-b833-8d3dc29a6c24", "2015",
    "caracteristiques_2014.csv", "https://www.data.gouv.fr/fr/datasets/r/85dfe8c6-589f-4e76-8a07-9f59e49ec10d", "2014",
    "vehicules_2014.csv", "https://www.data.gouv.fr/fr/datasets/r/86c64436-427f-4042-a4ee-ed0aa31bac76", "2014",
    "lieux_2014.csv", "https://www.data.gouv.fr/fr/datasets/r/617af155-1b7c-41d6-9504-576878c4d9af", "2014",
    "usagers_2014.csv", "https://www.data.gouv.fr/fr/datasets/r/457c10ff-ea6c-4238-9af1-d8dc62b896d4", "2014",
    "caracteristiques_2013.csv", "https://www.data.gouv.fr/fr/datasets/r/18b1a57a-57bf-4bf1-b9ee-dfa5a3154225", "2013",
    "vehicules_2013.csv", "https://www.data.gouv.fr/fr/datasets/r/3c059a3c-4624-4513-b3a4-2b18c48dfd47", "2013",
    "lieux_2013.csv", "https://www.data.gouv.fr/fr/datasets/r/1e00e4dd-e204-4a08-9e10-9b8a02791ba9", "2013",
    "usagers_2013.csv", "https://www.data.gouv.fr/fr/datasets/r/af4349c5-0293-4639-8694-b8b628bfc6c3", "2013",
    "caracteristiques_2012.csv", "https://www.data.gouv.fr/fr/datasets/r/b2518ec1-6529-47bc-9d55-40e2effeb0e7", "2012",
    "vehicules_2012.csv", "https://www.data.gouv.fr/fr/datasets/r/48683290-0d4d-429a-8fb6-977887098d5d", "2012",
    "usagers_2012.csv", "https://www.data.gouv.fr/fr/datasets/r/a19e060e-1c18-4272-ac4e-d4745ab8fade", "2012",
    "lieux_2012.csv", "https://www.data.gouv.fr/fr/datasets/r/59cc1244-2397-430a-8afb-6a0a071ff4d2", "2012",
    "caracteristiques_2011.csv", "https://www.data.gouv.fr/fr/datasets/r/37991267-8a15-4a9d-9b1c-ff3e6bea3625", "2011",
    "usagers_2011.csv", "https://www.data.gouv.fr/fr/datasets/r/bd946492-31b3-428e-8494-a1e203bdc9cc", "2011",
    "vehicules_2011.csv", "https://www.data.gouv.fr/fr/datasets/r/569e3f44-ff4c-4a25-bb45-f4a3646b392d", "2011",
    "lieux_2011.csv", "https://www.data.gouv.fr/fr/datasets/r/26d37f6b-3603-42b0-a779-bbeaa19af4a6", "2011",
    "caracteristiques_2010.csv", "https://www.data.gouv.fr/fr/datasets/r/decdfe8c-38ff-4a06-b7fc-615785f2914d", "2010",
    "lieux_2010.csv", "https://www.data.gouv.fr/fr/datasets/r/86577e9c-56ab-4673-95cb-3351e804fc03", "2010",
    "vehicules_2010.csv", "https://www.data.gouv.fr/fr/datasets/r/4dd8a9ea-785f-4e3f-8f83-3838a60ac7f5", "2010",
    "usagers_2010.csv", "https://www.data.gouv.fr/fr/datasets/r/c5e5664d-1483-41da-a4c6-5f1727d7a353", "2010",
    "caracteristiques_2009.csv", "https://www.data.gouv.fr/fr/datasets/r/fdfacdb9-f48e-4759-bae5-48d063216acb", "2009",
    "lieux_2009.csv", "https://www.data.gouv.fr/fr/datasets/r/0a25081b-89b6-4f7c-9d31-72ec679f0abf", "2009",
    "vehicules_2009.csv", "https://www.data.gouv.fr/fr/datasets/r/787ba26e-2588-47aa-b73d-346f120f9c59", "2009",
    "usagers_2009.csv", "https://www.data.gouv.fr/fr/datasets/r/2387db3d-11ee-4df4-aa31-4c3c748244d4", "2009",
    "caracteristiques_2008.csv", "https://www.data.gouv.fr/fr/datasets/r/722ebb99-c8b2-4635-bf8d-125dd280ee42", "2008",
    "vehicules_2008.csv", "https://www.data.gouv.fr/fr/datasets/r/6d9e4024-8207-4020-ae4c-5b83504e7268", "2008",
    "usagers_2008.csv", "https://www.data.gouv.fr/fr/datasets/r/433e26cf-d4c8-4dd9-b3f2-ecbc8a8f0509", "2008",
    "lieux_2008.csv", "https://www.data.gouv.fr/fr/datasets/r/237a4d23-1b66-43fb-8832-2f89fbbc6beb", "2008",
    "caracteristiques_2007.csv", "https://www.data.gouv.fr/fr/datasets/r/6fc7b169-4dfe-442c-8c28-8bd773aeddf8", "2007",
    "vehicules_2007.csv", "https://www.data.gouv.fr/fr/datasets/r/6e905a7a-c48d-4f5c-a0bb-54b83c8dfe5f", "2007",
    "lieux_2007.csv", "https://www.data.gouv.fr/fr/datasets/r/1d967969-c3d2-45c6-adc7-b3b72a8c6e89", "2007",
    "usagers_2007.csv", "https://www.data.gouv.fr/fr/datasets/r/c5c30fc2-9bfd-4bcd-b45b-f01a31f1d087", "2007",
    "caracteristiques_2006.csv", "https://www.data.gouv.fr/fr/datasets/r/fafa33cf-50cb-4092-a819-d5209f684089", "2006",
    "lieux_2006.csv", "https://www.data.gouv.fr/fr/datasets/r/28b1fbdc-f984-40d8-8614-236ee26adc7c", "2006",
    "vehicules_2006.csv", "https://www.data.gouv.fr/fr/datasets/r/c3362179-9c39-4056-9503-ce00ea6b810e", "2006",
    "usagers_2006.csv", "https://www.data.gouv.fr/fr/datasets/r/ebb4c37e-1616-497d-b5ed-f8113bed2ae7", "2006",
    "caracteristiques_2005.csv", "https://www.data.gouv.fr/fr/datasets/r/a47866f7-ece1-4de8-8d31-3a1b4f477e08", "2005",
    "vehicules_2005.csv", "https://www.data.gouv.fr/fr/datasets/r/924b962b-4400-4468-9f7d-0bdba28f51e9", "2005",
    "lieux_2005.csv", "https://www.data.gouv.fr/fr/datasets/r/3a3488e0-86a1-4917-b082-f3bdc25f6922", "2005",
    "usagers_2005.csv", "https://www.data.gouv.fr/fr/datasets/r/cecdbd46-11f2-41fa-b0bd-e6e223de6b3c", "2005"
  )

  expect_equal(get_datasets(), output)

})

test_that("get_datasets() works with one year", {

  output <- tibble::tribble(
    ~filename,                                                                          ~url,  ~year,
    "vehicules-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/b4aaeede-1a80-4d76-8f97-543dad479167", "2018",
    "usagers-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/72b251e1-d5e1-4c46-a1c2-c65f1b26549a", "2018",
    "lieux-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/d9d65ca1-16a3-4ea3-b7c8-2412c92b69d9", "2018",
    "caracteristiques-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/6eee0852-cbd7-447e-bd70-37c433029405", "2018"
  )

  expect_equal(get_datasets(2018), output)

})

test_that("get_datasets() works with multiple years", {

  expected_output <- tibble::tribble(
    ~filename,                                                                          ~url,  ~year,
    "vehicules-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/b4aaeede-1a80-4d76-8f97-543dad479167", "2018",
    "usagers-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/72b251e1-d5e1-4c46-a1c2-c65f1b26549a", "2018",
    "lieux-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/d9d65ca1-16a3-4ea3-b7c8-2412c92b69d9", "2018",
    "caracteristiques-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/6eee0852-cbd7-447e-bd70-37c433029405", "2018",
    "vehicules-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/d6103d0c-6db5-466f-b724-91cbea521533", "2017",
    "usagers-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/07bfe612-0ad9-48ef-92d3-f5466f8465fe", "2017",
    "lieux-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/9b76a7b6-3eef-4864-b2da-1834417e305c", "2017",
    "caracteristiques-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/9a7d408b-dd72-4959-ae7d-c854ec505354", "2017"
  )

  expect_equal(get_datasets(c(2018,2017)), expected_output)

})

test_that("get_datasets() returns an error if not numeric", {

  expect_error(get_datasets("text"), label = "Year(s) should be in a numeric vector")

})
