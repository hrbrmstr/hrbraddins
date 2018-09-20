#' Clean the environment and run the active script
#'
#' @export
cleanAndGo <- function() {

  ctx <- rstudioapi::getActiveDocumentContext()

  if (!is.null(ctx)) {

    do.call(rm, as.list(ls(all.names = TRUE, envir = .GlobalEnv)), envir = .GlobalEnv)

    tf <- tempfile(fileext = ".R")
    writeLines(ctx$contents, con = tf)

    source(tf, local = FALSE)

  }

}
