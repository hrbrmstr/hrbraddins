#' Join cr/lf-separated selected rows of text into a single space-separated row
#'
#' Turns
#' \preformatted{
#' a
#' b
#' c
#' d
#' }
#' into\cr\cr
#' \code{a b c d}
#'
#' @export
join_rows <- function() {

  ctx <- rstudioapi::getActiveDocumentContext()

  if (!is.null(ctx)) {

    if (ctx$selection[[1]]$text != "") {

      bits <- ctx$selection[[1]]$text
      bits <- gsub("[\r\n]+", " ", bits)
      bits <- paste0(bits, collapse="")

      rstudioapi::modifyRange(ctx$selection[[1]]$range, bits)

    }

  }

}
