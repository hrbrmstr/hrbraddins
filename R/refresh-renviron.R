#' Refreshes in-memory environment variables (if it exists)
#'
#' Equivanent to: `readRenviron("~/.Renviron")`
#'
#' @export
refresh_renviron <- function() {

  renv <- path.expand("~/.Renviron")

  curr_env <- gather(as_data_frame(as.list(Sys.getenv())), env_var, value)

  if (file.exists(renv)) readRenviron(renv)

  new_env <- gather(as_data_frame(as.list(Sys.getenv())), env_var, new_value)

  both_env <- full_join(curr_env, new_env, by="env_var")

  changed <- filter(both_env, value != new_value)
  if (nrow(changed) > 0) {
    cat(sprintf("The following environment variables were changed:\n%s",
                sprintf("  - %s\n", changed$env_var)))
  }

}


