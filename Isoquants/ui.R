library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  #Call on MathJax
  withMathJax(),

  # Application title
  titlePanel("Isoquant Curves for K and L"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
  #Slide for Intensity of Preferences, a
  sliderInput("a",
              HTML("Labor Intensity of Production (&alpha;)") ,
              min = 0.05,
              max = 0.95,
              value = 0.5,
              step = 0.05),
  
  #Slider for output level of isoquant curves
  sliderInput("x",
              HTML("Output of Lowest Isoquant Curve (x)"),
              min = 10,
              max = 50,
              value = 25,
              step = 5),
  
  #Slider for technology coefficient
  sliderInput("A",
              HTML("Technology Coefficient (A)"),
              min = 0.25,
              max = 3,
              value = 1,
              step = 0.25),
  
  #Slider for available costs
  sliderInput("C",
              HTML("Costs (C)"),
              min = 5,
              max = 200,
              value = 100,
              step = 5),
  #Slider for price of capital
  sliderInput("r",
              HTML("Price of Capital, p<sub>K</sub> or r"),
              min = 0.25,
              max = 5,
              value = 2.5,
              step = 0.25),
  #Slider for price of capital
  sliderInput("w",
              HTML("Price of Labor, p<sub>L</sub> or w"),
              min = 0.25,
              max = 5,
              value = 2.5,
              step = 0.25)

  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("linePlot")
  )
  )
))