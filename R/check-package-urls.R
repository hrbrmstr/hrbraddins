#' Check package URLs
#'
#' @export
check_package_urls <- function() {

  .pb <- NULL

  m_GET <- memoise::memoise(httr::GET) # avoid checking URL more than once

  tc <- function(x, where = NULL) {
    if (length(where)) message("- Looking in ", where, " files...")
    tryCatch(x, error = function(e) NULL)
  }

  pkg <- tc(rprojroot::find_package_root_file())

  if (is.null(pkg)) stop("Could not find package root.", call.=FALSE)

  message("Gathering URLs for {", basename(pkg), "} (this may take a bit)")

  dplyr::bind_rows(
    tc(tools:::url_db_from_package_HTML_files(pkg), "HTML"),
    tc(tools:::url_db_from_package_metadata(pkg), "metadata"),
    tc(tools:::url_db_from_package_news(pkg), "news"),
    tc(tools:::url_db_from_package_NEWS_md(pkg)),
    tc(tools:::url_db_from_package_Rd_db(pkg), "Rd"),
    tc(tools:::url_db_from_package_README_md(pkg), "README"),
    tc(tools:::url_db_from_package_sources(pkg), "source"),
    tc(tools:::url_db_from_PDF_files(pkg), "PDF"),
  ) %>%
    dplyr::distinct() %>%
    { .pb <<- dplyr::progress_estimated(nrow(.)) ;
    message("\nChecking found URLs (this may also take a bit)")
    . } %>%
    dplyr::mutate(status = purrr::map_dbl(URL, ~{
      .pb$tick()$print()
      tryCatch(httr::status_code(m_GET(url = .x)), error = 599)
    })) %>%
    janitor::clean_names() %>%
    tibble::as_tibble() %>%
    print(nrow(.))

}