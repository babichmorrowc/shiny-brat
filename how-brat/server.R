#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(farver)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  source("color_functions.R")
  
  # Calculate input rgb
  # color_rgb <- col2rgb(input$color)
  # ref_rgb <- col2rgb(input$reference)
  
  # Calculate percent brat for the three tabs
  rgb_dist <- reactive({
    color_distance(ref_color = input$reference,
                   new_color = input$color,
                   color_space = "rgb")
  })
  hsv_dist <- reactive({
    color_distance(ref_color = input$reference,
                   new_color = input$color,
                   color_space = "hsv")
  })
  # de_dist <- compare_colour(from = t(ref_rgb) * 255,
  #                           to = t(color_rgb) * 255,
  #                           from_space = "rgb",
  #                           method = "cie2000")
  # Text for headers
  output$rgb_result <- renderText({
    paste0(round(rgb_dist() * 100, 2), "% brat")
  })
  
  output$hsv_result <- renderText({
    paste0(round(hsv_dist() * 100, 2), "% brat")
  })
  
}
