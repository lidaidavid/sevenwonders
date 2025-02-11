#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(bslib)

source("helpers.R")


max_war = 16
max_coin = 30
max_sci = 6

ui <- page_navbar(
  title = "Seven Wonders: all packs",
  bg = "#2D89C8",
  inverse = TRUE,
  nav_panel(title = "War", fluidPage(
    
    # Application title
    titlePanel("War Results"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(position = "right",
      sidebarPanel(width = 8,
        sliderInput("player",
                    "how many players involved",
                    min = 0,
                    max = 7,
                    value = 7),
        
        sliderInput("player1",
                    "player 1 war point",
                    min = 0,
                    max = max_war,
                    value = 0),
        sliderInput("player2",
                    "player 2 war point",
                    min = 0,
                    max = max_war,
                    value = 0),
        sliderInput("player3",
                    "player 3 war point",
                    min = 0,
                    max = max_war,
                    value = 0),
        sliderInput("player4",
                    "player 4 war point",
                    min = 0,
                    max = max_war,
                    value = 0),
        sliderInput("player5",
                    "player 5 war point",
                    min = 0,
                    max = max_war,
                    value = 0),
        sliderInput("player6",
                    "player 6 war point",
                    min = 0,
                    max = max_war,
                    value = 0),
        sliderInput("player7",
                    "player 7 war point",
                    min = 0,
                    max = max_war,
                    value = 0)
      ),
      
      mainPanel(width = 4,
        tableOutput("war") 
      )
    )
  )

            ),
  nav_panel(title = "Coin Score", fluidPage(
    
    # Application title
    titlePanel("Coin Score"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(position = "right",
      sidebarPanel(width=8,
        sliderInput("coin",
                    "how much coin",
                    min = 0,
                    max = max_coin,
                    value = 10),
       
        sliderInput("debt",
                    "how much debt",
                    min = 0,
                    max = max_coin,
                    value = 0)
      ),
      
      mainPanel(width=4,
        tableOutput("coin") 
      )
    )
  )),
  nav_panel(title = "Science Score", fluidPage(
    
    # Application title
    titlePanel("Science Score"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(position = "right",
      sidebarPanel(width=8,
        sliderInput("A",
                    "A: the compass",
                    min = 0,
                    max = max_sci,
                    value = 0),
        sliderInput("O",
                    "O: the cog",
                    min = 0,
                    max = max_sci,
                    value = 0),
        sliderInput("E",
                    "E: the tablet",
                    min = 0,
                    max = max_sci,
                    value = 0),
        sliderInput("AO",
                    "A or O",
                    min = 0,
                    max = max_sci,
                    value = 0),
        sliderInput("AE",
                    "A or E",
                    min = 0,
                    max = max_sci,
                    value = 0),
        sliderInput("OE",
                    "O or E",
                    min = 0,
                    max = max_sci,
                    value = 0),
        sliderInput("AOE",
                    "A or O or E",
                    min = 0,
                    max = max_sci,
                    value = 0),
        sliderInput("plus",
                    "plus one for the one you have the most",
                    min = 0,
                    max = max_sci,
                    value = 0)
      ),
      
      mainPanel(width=4,
        tableOutput("sci") 
      )
    )
  )),
  nav_panel(title = "Total Score", fluidPage(
    
    # Application title
    titlePanel("Total Score"),
    sliderInput("player_total",
                "how many players played",
                min = 0,
                max = 7,
                value = 7),
    page_fillable(layout_columns(
    # Sidebar with a slider input for number of bins 
      card(
        textInput("name1", "Player 1 name", value="周"),
        textInput("name2", "Player 2 name"),
        textInput("name3", "Player 3 name"),
        textInput("name4", "Player 4 name"),
        textInput("name5", "Player 5 name"),
        textInput("name6", "Player 6 name"),
        textInput("name7", "Player 7 name")
      ),
    
    card(
      style = "background-color: pink;",
      numericInput("war1", "Player 1 war",value = ""),
      numericInput("war2", "Player 2 war",value = ""),
      numericInput("war3", "Player 3 war",value = ""),
      numericInput("war4", "Player 4 war",value = ""),
      numericInput("war5", "Player 5 war",value = ""),
      numericInput("war6", "Player 6 war",value = ""),
      numericInput("war7", "Player 7 war",value = "")
    ),
    card(
      style = "background-color: gold;",
      numericInput("coin1", "Player 1 coin",value = ""),
      numericInput("coin2", "Player 2 coin",value = ""),
      numericInput("coin3", "Player 3 coin",value = ""),
      numericInput("coin4", "Player 4 coin",value = ""),
      numericInput("coin5", "Player 5 coin",value = ""),
      numericInput("coin6", "Player 6 coin",value = ""),
      numericInput("coin7", "Player 7 coin",value = "")
    ),
    card(
      style = "background-color: lightgrey;",
      numericInput("wonder1", "Player 1 wonder",value = ""),
      numericInput("wonder2", "Player 2 wonder",value = ""),
      numericInput("wonder3", "Player 3 wonder",value = ""),
      numericInput("wonder4", "Player 4 wonder",value = ""),
      numericInput("wonder5", "Player 5 wonder",value = ""),
      numericInput("wonder6", "Player 6 wonder",value = ""),
      numericInput("wonder7", "Player 7 wonder",value = "")
    ),
    card(
      style = "background-color: lightblue;",
      numericInput("blue1", "Player 1 blue",value = ""),
      numericInput("blue2", "Player 2 blue",value = ""),
      numericInput("blue3", "Player 3 blue",value = ""),
      numericInput("blue4", "Player 4 blue",value = ""),
      numericInput("blue5", "Player 5 blue",value = ""),
      numericInput("blue6", "Player 6 blue",value = ""),
      numericInput("blue7", "Player 7 blue",value = "")
    ),
    card(
      style = "background-color: lightgreen;",
      numericInput("green1", "Player 1 green",value = ""),
      numericInput("green2", "Player 2 green",value = ""),
      numericInput("green3", "Player 3 green",value = ""),
      numericInput("green4", "Player 4 green",value = ""),
      numericInput("green5", "Player 5 green",value = ""),
      numericInput("green6", "Player 6 green",value = ""),
      numericInput("green7", "Player 7 green",value = "")
    ),
    card(
      style = "background-color: lightyellow;",
      numericInput("yellow1", "Player 1 yellow",value = ""),
      numericInput("yellow2", "Player 2 yellow",value = ""),
      numericInput("yellow3", "Player 3 yellow",value = ""),
      numericInput("yellow4", "Player 4 yellow",value = ""),
      numericInput("yellow5", "Player 5 yellow",value = ""),
      numericInput("yellow6", "Player 6 yellow",value = ""),
      numericInput("yellow7", "Player 7 yellow",value = "")
    ),    
    card(
      style = "background-color: plum;",
      numericInput("purple1", "Player 1 purple",value = ""),
      numericInput("purple2", "Player 2 purple",value = ""),
      numericInput("purple3", "Player 3 purple",value = ""),
      numericInput("purple4", "Player 4 purple",value = ""),
      numericInput("purple5", "Player 5 purple",value = ""),
      numericInput("purple6", "Player 6 purple",value = ""),
      numericInput("purple7", "Player 7 purple",value = "")
    ),    
    card(
      style = "background-color: darkgrey;",
      numericInput("black1", "Player 1 black",value = ""),
      numericInput("black2", "Player 2 black",value = ""),
      numericInput("black3", "Player 3 black",value = ""),
      numericInput("black4", "Player 4 black",value = ""),
      numericInput("black5", "Player 5 black",value = ""),
      numericInput("black6", "Player 6 black",value = ""),
      numericInput("black7", "Player 7 black",value = "")
    ),
    card(
      numericInput("white1", "Player 1 white",value = ""),
      numericInput("white2", "Player 2 white",value = ""),
      numericInput("white3", "Player 3 white",value = ""),
      numericInput("white4", "Player 4 white",value = ""),
      numericInput("white5", "Player 5 white",value = ""),
      numericInput("white6", "Player 6 white",value = ""),
      numericInput("white7", "Player 7 white",value = "")
    ),
    card(
      style = "background-color: cyan;",
      numericInput("ship1", "Player 1 ship",value = ""),
      numericInput("ship2", "Player 2 ship",value = ""),
      numericInput("ship3", "Player 3 ship",value = ""),
      numericInput("ship4", "Player 4 ship",value = ""),
      numericInput("ship5", "Player 5 ship",value = ""),
      numericInput("ship6", "Player 6 ship",value = ""),
      numericInput("ship7", "Player 7 ship",value = "")
    ),
    card(
      style = "background-color: steelblue;",
      numericInput("island1", "Player 1 island",value = ""),
      numericInput("island2", "Player 2 island",value = ""),
      numericInput("island3", "Player 3 island",value = ""),
      numericInput("island4", "Player 4 island",value = ""),
      numericInput("island5", "Player 5 island",value = ""),
      numericInput("island6", "Player 6 island",value = ""),
      numericInput("island7", "Player 7 island",value = "")
    ))),
    card(
        tableOutput("total") 
      )
    
  )),
  nav_spacer()
  )


# Define server logic required to draw a histogram
server <- function(input, output) {
  sliderValues_coin <- reactive({get_money(input$coin,
                                    input$debt)
    
  })
  
  
  output$coin <- renderTable({sliderValues_coin()},
                               digits = 0)
 
  sliderValues_war <- reactive({get_wl(c(input$player1,
                                         input$player2,
                                         input$player3,
                                         input$player4,
                                         input$player5,
                                         input$player6,
                                         input$player7
                                         )[1:input$player])
    
  })
  
  
  output$war <- renderTable({sliderValues_war()},
                             digits = 0)  
   
  
  sliderValues <- reactive({get_sci(input$A,
                                    input$O,
                                    input$E,
                                    input$AO,
                                    input$AE,
                                    input$OE,
                                    input$AOE,
                                    input$plus)
    
  })
  
  
  output$sci <- renderTable({sliderValues()},
                            digits = 0)  
  
  sliderValues_total <- reactive({get_total(np = input$player_total,
        name = c(input$name1, input$name2, input$name3, input$name4, input$name5, input$name6, input$name7),
        war = c(input$war1, input$war2, input$war3, input$war4, input$war5, input$war6, input$war7),
        coin = c(input$coin1, input$coin2, input$coin3, input$coin4, input$coin5, input$coin6, input$coin7),
        wonder = c(input$wonder1, input$wonder2, input$wonder3, input$wonder4, input$wonder5, input$wonder6, input$wonder7),
        blue = c(input$blue1, input$blue2, input$blue3, input$blue4, input$blue5, input$blue6, input$blue7),
        green = c(input$green1, input$green2, input$green3, input$green4, input$green5, input$green6, input$green7),
        yellow = c(input$yellow1, input$yellow2, input$yellow3, input$yellow4, input$yellow5, input$yellow6, input$yellow7),
        purple = c(input$purple1, input$purple2, input$purple3, input$purple4, input$purple5, input$purple6, input$purple7),
        black = c(input$black1, input$black2, input$black3, input$black4, input$black5, input$black6, input$black7),
        white = c(input$white1, input$white2, input$white3, input$white4, input$white5, input$white6, input$white7),
        ship = c(input$ship1, input$ship2, input$ship3, input$ship4, input$ship5, input$ship6, input$ship7),
        island = c(input$island1, input$island2, input$island3, input$island4, input$island5, input$island6, input$island7)
          )[1:input$player_total,]
    
  })
  
  
  output$total <- renderTable({sliderValues_total()},
                            digits = 0)   
}

# Run the application 
shinyApp(ui = ui, server = server)
