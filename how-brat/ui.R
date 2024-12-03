#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("how brat is it, anyways"),
  
  sidebarLayout(
    # Sidebar panel for inputs
    sidebarPanel(
      # Input: Text input for color
      textInput("color", "Hex code (6 characters):", value = "#D60270"),
      
      # Input: Text input for reference
      textInput("reference", "Reference hex code:", value = "#9ACC3F")
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      # Tabs
      tabsetPanel(
        tabPanel("RGB", h3(textOutput("rgb_result"))),
        tabPanel("HSV", h3(textOutput("hsv_result"))),
        tabPanel("CIELAB", h3(textOutput("deltae_result")))
      )
    )
  )
)
