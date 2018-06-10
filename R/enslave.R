#' Run a selection as an RStudio background job
#'
#' @export
enslave <- function() {

  ctx <- rstudioapi::getActiveDocumentContext()

  if (!is.null(ctx)) {

    if (ctx$selection[[1]]$text != "") {

      bits <- ctx$selection[[1]]$text

      tf <- tempfile(fileext = ".R")
      writeLines(bits, con = tf)

      nm <- sprintf("enslaved_%s", gsub("\\-", "", uuid::UUIDgenerate()))

      .rs.api.runScriptJob(
        path = tf,
        workingDir = getwd(),
        importEnv = TRUE,
        exportEnv = nm
      )

      message("Job started. Results will be in ", nm)

    }

  }

}
