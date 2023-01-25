#

library(shiny)

ui <- fluidPage(

  tags$head(
    tags$script(src="getIP.js")
  ),
    # Application title
    titlePanel("Check my IP"),
    verbatimTextOutput("ip_info")

)

# Define server logic required to draw a histogram
server <- function(input, output, session) {


  IP <- reactive({ input$getIP })

  output$ip_info <- renderPrint({

    #browser()
    str(IP())
    #cat(capture.output(str(IP()), split=TRUE))

  })

  observe({
    cat(capture.output(str(IP()), split=TRUE))
  })

}

# Run the application
shinyApp(ui = ui, server = server)
