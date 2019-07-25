#' Run {tinytest} on a package
#'
#' You should really bind this to something like cmd-opt-shift-t.
#'
#' @export
run_tiny_test <- function() {
  try(tinytest::test_all(rprojroot::find_package_root_file()), silent = TRUE)
}