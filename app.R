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
  
  # science
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
        sliderInput("AOE",
                    "A or O or E",
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

        checkboxInput("cycle", "turn A or O or E into AOE"),
        checkboxInput("plus", "plus one for the symbol you have the most")
        
        
        # sliderInput("cycle",
        #             "turn A or O or E into AOE",
        #             min = 0,
        #             max = 1,
        #             value = 0),
        # sliderInput("plus",
        #             "plus one for the symbol you have the most",
        #             min = 0,
        #             max = 1,
        #             value = 0)
      ),
      
      mainPanel(width=4,
        tableOutput("sci") 
      )
    )
  )),
  # total
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
        textInput("name1", "P 1 name"),
        textInput("name2", "P 2 name"),
        textInput("name3", "P 3 name"),
        textInput("name4", "P 4 name"),
        textInput("name5", "P 5 name"),
        textInput("name6", "P 6 name"),
        textInput("name7", "P 7 name")
      ),
    
    card(
      style = "background-color: pink;",
      numericInput("war1", "P 1 war",value = ""),
      numericInput("war2", "P 2 war",value = ""),
      numericInput("war3", "P 3 war",value = ""),
      numericInput("war4", "P 4 war",value = ""),
      numericInput("war5", "P 5 war",value = ""),
      numericInput("war6", "P 6 war",value = ""),
      numericInput("war7", "P 7 war",value = "")
    ),
    card(
      style = "background-color: gold;",
      numericInput("coin1", "P 1 coin",value = ""),
      numericInput("coin2", "P 2 coin",value = ""),
      numericInput("coin3", "P 3 coin",value = ""),
      numericInput("coin4", "P 4 coin",value = ""),
      numericInput("coin5", "P 5 coin",value = ""),
      numericInput("coin6", "P 6 coin",value = ""),
      numericInput("coin7", "P 7 coin",value = "")
    ),
    card(
      style = "background-color: lightgrey;",
      numericInput("wonder1", "P 1 wonder",value = ""),
      numericInput("wonder2", "P 2 wonder",value = ""),
      numericInput("wonder3", "P 3 wonder",value = ""),
      numericInput("wonder4", "P 4 wonder",value = ""),
      numericInput("wonder5", "P 5 wonder",value = ""),
      numericInput("wonder6", "P 6 wonder",value = ""),
      numericInput("wonder7", "P 7 wonder",value = "")
    ),
    card(
      style = "background-color: lightblue;",
      numericInput("blue1", "P 1 blue",value = ""),
      numericInput("blue2", "P 2 blue",value = ""),
      numericInput("blue3", "P 3 blue",value = ""),
      numericInput("blue4", "P 4 blue",value = ""),
      numericInput("blue5", "P 5 blue",value = ""),
      numericInput("blue6", "P 6 blue",value = ""),
      numericInput("blue7", "P 7 blue",value = "")
    ),
    card(
      style = "background-color: lightgreen;",
      numericInput("green1", "P 1 green",value = ""),
      numericInput("green2", "P 2 green",value = ""),
      numericInput("green3", "P 3 green",value = ""),
      numericInput("green4", "P 4 green",value = ""),
      numericInput("green5", "P 5 green",value = ""),
      numericInput("green6", "P 6 green",value = ""),
      numericInput("green7", "P 7 green",value = "")
    ),
    card(
      style = "background-color: lightyellow;",
      numericInput("yellow1", "P 1 yellow",value = ""),
      numericInput("yellow2", "P 2 yellow",value = ""),
      numericInput("yellow3", "P 3 yellow",value = ""),
      numericInput("yellow4", "P 4 yellow",value = ""),
      numericInput("yellow5", "P 5 yellow",value = ""),
      numericInput("yellow6", "P 6 yellow",value = ""),
      numericInput("yellow7", "P 7 yellow",value = "")
    ),    
    card(
      style = "background-color: plum;",
      numericInput("purple1", "P 1 purple",value = ""),
      numericInput("purple2", "P 2 purple",value = ""),
      numericInput("purple3", "P 3 purple",value = ""),
      numericInput("purple4", "P 4 purple",value = ""),
      numericInput("purple5", "P 5 purple",value = ""),
      numericInput("purple6", "P 6 purple",value = ""),
      numericInput("purple7", "P 7 purple",value = "")
    ),    
    card(
      style = "background-color: darkgrey;",
      numericInput("black1", "P 1 black",value = ""),
      numericInput("black2", "P 2 black",value = ""),
      numericInput("black3", "P 3 black",value = ""),
      numericInput("black4", "P 4 black",value = ""),
      numericInput("black5", "P 5 black",value = ""),
      numericInput("black6", "P 6 black",value = ""),
      numericInput("black7", "P 7 black",value = "")
    ),
    card(
      numericInput("white1", "P 1 white",value = ""),
      numericInput("white2", "P 2 white",value = ""),
      numericInput("white3", "P 3 white",value = ""),
      numericInput("white4", "P 4 white",value = ""),
      numericInput("white5", "P 5 white",value = ""),
      numericInput("white6", "P 6 white",value = ""),
      numericInput("white7", "P 7 white",value = "")
    ),
    card(
      style = "background-color: cyan;",
      numericInput("ship1", "P 1 ship",value = ""),
      numericInput("ship2", "P 2 ship",value = ""),
      numericInput("ship3", "P 3 ship",value = ""),
      numericInput("ship4", "P 4 ship",value = ""),
      numericInput("ship5", "P 5 ship",value = ""),
      numericInput("ship6", "P 6 ship",value = ""),
      numericInput("ship7", "P 7 ship",value = "")
    ),
    card(
      style = "background-color: steelblue;",
      numericInput("island1", "P 1 island",value = ""),
      numericInput("island2", "P 2 island",value = ""),
      numericInput("island3", "P 3 island",value = ""),
      numericInput("island4", "P 4 island",value = ""),
      numericInput("island5", "P 5 island",value = ""),
      numericInput("island6", "P 6 island",value = ""),
      numericInput("island7", "P 7 island",value = "")
    ))),
    card(
        tableOutput("total") 
      ),
    nav_spacer()
    
  )),
# war
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
# coin
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
                                         max = 10,
                                         value = 0)
                ),
                
                mainPanel(width=4,
                          tableOutput("coin") 
                )
  )
)),
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
   
  
  sliderValues <- reactive({get_sci(A = input$A,
                                    O = input$O,
                                    E = input$E,
                                    AO = input$AO,
                                    AE = input$AE,
                                    OE = input$OE,
                                    AOE = input$AOE,
                                    cycle = input$cycle,
                                    plus = input$plus)
    
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
