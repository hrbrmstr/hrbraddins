#' Path Split
#'
#' @export
pathSplit <- function() {

  ctx <- rstudioapi::getActiveDocumentContext()

  print(str(ctx$selection))

  if (!is.null(ctx)) {

    if (ctx$selection[[1]]$text != "") {

      found <- stri_match_first_regex(ctx$selection[[1]]$text, '"([^"]*)"')

      repl <- paste0(sprintf('"%s"', unlist(fs::path_split(found[2]))), collapse = ", ")

      rstudioapi::modifyRange(
        ctx$selection[[1]]$range,
        stri_replace_first_fixed(ctx$selection[[1]]$text, found[1], repl)
      )

    }

  }

}
