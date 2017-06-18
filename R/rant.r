#' Make it easier to annoy followers and reinforce one's entitlement.
#'
#' @export
rantAddin <- function() {

  # Get the document context.
  context <- rstudioapi::getActiveDocumentContext()

  # Set the default data to use based on the selection.
  text <- context$selection[[1]]$text
  defaultData <- text

  # Generate UI for the gadget.
  ui <- miniPage(
    gadgetTitleBar("Twitter Rant!"),
    miniContentPanel(
      textAreaInput("storm", "Twitter Rant", cols = 120, rows = 10),
      htmlOutput("output")
    )
  )


  # Server code for the gadget.
  server <- function(input, output, session) {

    reactiveData <- reactive({
      dataString <- input$storm
      dataString
    })

    output$output <- renderText({
      data <- reactiveData()
      if (nzchar(data) > 0) {
        tweet_base <- stringi::stri_wrap(data, 134)
        paste0(sprintf("%s %d/%d", tweet_base, 1:length(tweet_base), length(tweet_base)), collapse="<br/>\n<br/>\n")
      } else {
        ""
      }
    })

    # Listen for 'done'.
    observeEvent(input$done, {
      invisible(stopApp())
    })
  }

  # Use a modal dialog as a viewr.
  viewer <- dialogViewer("Twitter Rant!", width = 1000, height = 800)
  runGadget(ui, server, viewer = viewer)

}