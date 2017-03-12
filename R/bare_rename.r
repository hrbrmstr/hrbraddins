#' Turn a selection of comma-separated bare strings into a dplyr::rename statement
#'
#' Turns \cr\cr
#' \code{a,b c,d,e f}\cr\cr
#' or\cr\cr
#' \code{a, b c, d, e f}\cr\cr
#' into\cr\cr
#' \code{dplyr::rename(a, `b c`, d, `e f`)}
#'
#' @export
bare_rename <- function() {

  ctx <- rstudioapi::getActiveDocumentContext()

  if (!is.null(ctx)) {

    if (ctx$selection[[1]]$text != "") {

      bits <- utils::read.csv(text = ctx$selection[[1]]$text,
                              stringsAsFactors = FALSE,
                              header = FALSE)

      bits <- unlist(bits, use.names = FALSE)

      op <- options("useFancyQuotes")
      options(useFancyQuotes = FALSE)

      bits <- sapply(bits, trimws)
      bits <- ifelse(grepl(" ", bits), dQuote(bits), bits)
      bits <- gsub('^"|"$', '`', bits)

      options(op)

      bits <- paste0(bits, collapse = ", ")
      bits <- sprintf("dplyr::rename(%s)", bits)

      rstudioapi::modifyRange(ctx$selection[[1]]$range, bits)

    }

  }

}
