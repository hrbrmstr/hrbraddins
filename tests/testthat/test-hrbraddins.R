context("basic functionality")
test_that("we can do something", {

  expect_error(bare_combine())
  expect_error(bare_rename())
  expect_error(join_rows())

})
