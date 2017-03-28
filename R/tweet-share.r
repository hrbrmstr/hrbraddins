#' Share the active RStudio source tab on Twitter
#'
#' TODO tempdir/tempfile; error checking
#'
#' @export
tweet_share <- function() {

  ctx <- rstudioapi::getSourceEditorContext()

  writeLines(ctx$contents, "/tmp/a.r")
  g <- gistr::gist_create("/tmp/a.r", browse=FALSE)

  fil <- file("/tmp/a.rmd", open = "w")
  writeLines(c(
    "---",
    "output: pdf_document",
    "---",
    "\\pagenumbering{gobble}",
    "```{r eval=FALSE}",
    ctx$contents,
    "```",
    sprintf("gist: [%s](%s)", g$url, g$url)),
  fil)
  close(fil)

  rmarkdown::render("/tmp/a.rmd", rmarkdown::pdf_document(), "/tmp/a.pdf")

  code_raster <- pdftools::pdf_render_page("/tmp/a.pdf", dpi=144)

  img <- magick::image_read(code_raster)
  img <- magick::image_trim(img)

  magick::image_write(img, "/tmp/a.png")

  #magick::image_browse(img)

  twitteR::tweet(sprintf("R code: %s", g$url), mediaPath = "/tmp/a.png")

}
