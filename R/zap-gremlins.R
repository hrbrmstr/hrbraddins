#' Find R source files with non-ASCII characters
#'
#' @export
zapGremlins <- function() {

  d <- selectDirectory()

  sapply(
    list.files(d, pattern = "[.][Rr]$", full.names = TRUE),
    function(.x) {
       res <- capture.output(tools::showNonASCIIfile(.x), type = "message")
       if (length(res)) {
         res <- paste0(c(sprintf("# %s -----------\n", .x), res), collapse="\n")
       }
    }
  ) -> out

  out <- paste0(out, collapse = "\n\n")

  rstudioapi::documentNew(out)

}

