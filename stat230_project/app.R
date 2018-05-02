#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(plotly)

server <- function(input, output, session) {
  
  dat <- reactive(RodentsP[1:input$myslider,])
  
  output$myplot <- renderPlotly({
    p <- ggplot(dat(), aes(AdultBodyMassg, MaxLongevitym)) + geom_point(color="purple")
    p <- ggplotly(p)
    p
  })
}

ui <- basicPage(
  
  h3("Interactive Scatter Plot"),
  sliderInput("myslider", "A slider:", min=100, max=700, value=10),
  plotlyOutput("myplot")
  
)

shinyApp(ui = ui, server = server)

