#' Turn a selection of space-separated bare strings into a base::combine statement
#'
#' Turns \cr\cr
#' \code{a b c d e f}\cr\cr
#' into\cr\cr
#' \code{c("a", "b", "c", "d", "e", "f")}
#'
#' If the option `hrbraddins_uspace` is set TRUE, underscores will be
#' converted to spaces before the final combine statement is created.
#'
#' @export
bare_space_combine <- function() {

  ctx <- rstudioapi::getActiveDocumentContext()

  if (!is.null(ctx)) {

    if (ctx$selection[[1]]$text != "") {

      bits <- stri_trim_both(ctx$selection[[1]]$text)
      bits <- stri_split_regex(bits, "[[:space:]]+")
      bits <- unlist(bits, use.names = FALSE)

      qu <- options("useFancyQuotes")
      options(useFancyQuotes = FALSE)

      uspace <- as.logical(getOption("hrbraddins_uspace", FALSE))
      if (uspace) bits <- stri_replace_all_fixed(bits, "_", " ")

      bits <- sapply(bits, dQuote)

      options(qu)

      bits <- paste0(bits, collapse = ", ")
      bits <- sprintf("c(%s)", bits)

      rstudioapi::modifyRange(ctx$selection[[1]]$range, bits)

    }

  }

}
