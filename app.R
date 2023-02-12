library(shiny)
library(rhandsontable)
library(shinyWidgets)
library(tidyverse)

ui <- fluidPage(
  
  tabsetPanel(
    id = "CROI_tabs",
    #type = "hidden",
    
    ###
    tabPanel(
      "croi",
      
      h1("C-ROI"),
      p("An analytical tool for evaluating conservation investments"), 
      actionButton(
        inputId = "continue",
        label = "Continue"
      ),
      actionButton(
        inputId = "skip_intro",
        label = "SKIP INTRO"
      )
      
    ),
    
    ###
    tabPanel(
      "intro",
      
      h1("Introduction"),
      p("Cool (and brief) explanation of the ROI analysis"),
      img(src = "video.png", height = "60%", width = "60%"),
      br(),
      br(),
      actionButton(
        inputId = "back_1",
        label = "Back"
      ),
      actionButton(
        inputId = "next_1",
        label = "Next"
      )
      
      
    ),
    
    ###
    tabPanel(
      "elements",
      
      h1("Elements of the analysis"),
      h4("Theory of change"),
      img(src = "toc.png", height = "60%", width = "60%"),
      p("If [inputs] and [activities] produce [outputs] this should lead to [outcomes] which, if [impactful], will ultimately contribute to [goal]."),
      actionButton(
        inputId = "back_2",
        label = "Back"
      ),
      actionButton(
        inputId = "next_2",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "general",
      
      h1("General"),
      p("Add text boxes"),
      actionButton(
        inputId = "back_3",
        label = "Back"
      ),
      actionButton(
        inputId = "next_3",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "inputs",
      
      h1("Inputs"),
      p("Which costs will you consider in the analysis?"),
      p("Add checkbox"),
      actionButton(
        inputId = "back_4",
        label = "Back"
      ),
      actionButton(
        inputId = "next_4",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "inputs1",
      
      h1("Inputs"),
      p("List all significant costs incurred on the project"),
      p("Add table"),
      actionButton(
        inputId = "back_5",
        label = "Back"
      ),
      actionButton(
        inputId = "next_5",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "outcomes",
      
    h1("Outcomes"),
    img(src = "outcomes.png", height = "50%", width = "50%"),
    p("What outcomes will be taken into account?"),
    p("Add checkbox"),
    actionButton(
      inputId = "back_6",
      label = "Back"
    ),
    actionButton(
      inputId = "next_6",
      label = "Next"
    )
    
    ),
    
    ###
    tabPanel(
      "outcomes1",
      
      h1("Outcomes"),
      p("Specify the Main Outcome of the project"),
      #p("Are there any additional outcomes you want to add? (select up to 2 additional outcomes)"),
      
      ##
      textInput("main_outcome", label = h3("Main Outcome"), value = "Enter text..."),
      textInput("outcome_indicator", label = h5("Outcome Indicator"), value = "Enter text..."),
      textInput("units", label = h5("Units"), value = "Enter text..."),
      
      airDatepickerInput("start",
                         label = "Start",
                         value = "2022",
                         maxDate = "2050",
                         minDate = "1900",
                         view = "years", 
                         minView = "years", 
                         dateFormat = "yyyy"
      ),
      
      airDatepickerInput("finish",
                         label = "Finish",
                         value = "2022",
                         maxDate = "2300",
                         minDate = "1900",
                         view = "years", 
                         minView = "years", 
                         dateFormat = "yyyy"
      ),
      
      ##
      
      #p("Add table"),
      actionButton(
        inputId = "back_7",
        label = "Back"
      ),
      actionButton(
        inputId = "next_7",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "outcomes2",
      
      h1("Outcomes"),
      #p("When does each outcome start?"),
      #p("Add table"),
     
      ##
      
      #helpText(verbatimTextOutput("value")),
      rHandsontableOutput("table"),
      br(),
      actionButton("saveBtn","Save"),
      br(),
      br(),
      ##
      
      
      actionButton(
        inputId = "back_8",
        label = "Back"
      ),
      actionButton(
        inputId = "next_8",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "outcomes3",
      
      h1("Outcomes"),
      p("Are there any additional outcomes you would like to add? (you can specify up to 2 additional outcomes)"),
      actionButton(
        inputId = "yes_add",
        label = "Yes"
      ),
      actionButton(
        inputId = "no_add",
        label = "No"
      ),
      br(),
      br(),
      br(),
      actionButton(
        inputId = "back_9",
        label = "Back"
      )
      #actionButton(
        #inputId = "next_9",
        #label = "Next"
      #)
    
    ),
    
    ###
    tabPanel(
      "outcomes4",
      
      h1("Outcomes"),
      p("Choose one indicator for each of the outcomes"),
      
      ##
      
      textInput("add_outcome1", label = h3("Additional Outcome #1"), value = "Enter text..."),
      textInput("outcome_indicator1", label = h5("Outcome Indicator"), value = "Enter text..."),
      textInput("units1", label = h5("Units"), value = "Enter text..."),
      
      airDatepickerInput("start1",
                         label = "Start",
                         value = "2022",
                         maxDate = "2050",
                         minDate = "1900",
                         view = "years", 
                         minView = "years", 
                         dateFormat = "yyyy"
      ),
      
      airDatepickerInput("finish1",
                         label = "Finish",
                         value = "2022",
                         maxDate = "2300",
                         minDate = "1900",
                         view = "years", 
                         minView = "years", 
                         dateFormat = "yyyy"
      ),
      
      ##
      
      
      actionButton(
        inputId = "back_10",
        label = "Back"
      ),
      actionButton(
        inputId = "next_10",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "outcomes5",
      
      h1("Outcomes"),
      p("What is the measured/predicted value of each outcome indicator?"),
      p("Add table"),
      
      ##
      #helpText(verbatimTextOutput("value")),
      rHandsontableOutput("table1"),
      br(),
      actionButton("save_add_out1","Save"),
      br(),
      br(),
      
      
      
      ##
      actionButton(
        inputId = "add_other",
        label = "Add a second Additional Outcome"
      ),
      actionButton(
        inputId = "no_add_other",
        label = "Continue without adding a second Additional Outcome"
      ),
      br(),
      br(),
      br(),
      actionButton(
        inputId = "back_11",
        label = "Back"
      ),
      #actionButton(
        #inputId = "next_11",
        #label = "Next"
      #)
    
    ),
    
    ###
    tabPanel(
      "outcomesx",
      
      h1("Outcomes"),
      p("x"),
      
      ##
      
      textInput("add_outcome2", label = h3("Additional Outcome #2"), value = "Enter text..."),
      textInput("outcome_indicator2", label = h5("Outcome Indicator"), value = "Enter text..."),
      textInput("units2", label = h5("Units"), value = "Enter text..."),
      
      airDatepickerInput("start2",
                         label = "Start",
                         value = "2022",
                         maxDate = "2050",
                         minDate = "1900",
                         view = "years", 
                         minView = "years", 
                         dateFormat = "yyyy"
      ),
      
      airDatepickerInput("finish2",
                         label = "Finish",
                         value = "2022",
                         maxDate = "2300",
                         minDate = "1900",
                         view = "years", 
                         minView = "years", 
                         dateFormat = "yyyy"
      ),
      
      ##
      
      actionButton(
        inputId = "back_x",
        label = "Back"
      ),
      actionButton(
        inputId = "next_x",
        label = "Next"
      )
      
    ),
    
    ###
    
    tabPanel(
      "outcomesxx",
      
      h1("Outcomes"),
      p("xx"),
      
      ##
      #helpText(verbatimTextOutput("value")),
      rHandsontableOutput("table2"),
      br(),
      actionButton("save_add_out2","Save"),
      br(),
      br(),
      
      
      
      ##
      
      actionButton(
        inputId = "back_xx",
        label = "Back"
      ),
      actionButton(
        inputId = "next_xx",
        label = "Next"
      )
      
    ),
    
    
    tabPanel(
      "outcomes6",
      
      h1("Outcomes"),
      p("Will any of the outcomes be valued in monetary equivalents?"),
      p("Add checkbox"),
      actionButton(
        inputId = "back_12",
        label = "Back"
      ),
      actionButton(
        inputId = "next_12",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "outcomes7",
      
      h1("Outcomes"),
      p("Select the outcome(s) to be valued in monetary equivalents:"),
      p("Add checkbox"),
      
      p("What is the monetized value per unit of the selected outcome?"),
      rHandsontableOutput("table3"),
      br(),
      actionButton("save_mon_value","Save"),
      br(),
      br(),
      actionButton(
        inputId = "back_13",
        label = "Back"
      ),
      actionButton(
        inputId = "next_13",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "outcomes8",
      
      h1("Outcomes"),
      p("What will be the discount rate used to calculate the present value of the outcomes?"),
      p("Add text box"),
      actionButton(
        inputId = "back_14",
        label = "Back"
      ),
      actionButton(
        inputId = "next_14",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "impact",
      
      h1("Impact"),
      h4("Counterfactual"),
      p("Cool (and brief) explanation of additionality"),
      actionButton(
        inputId = "back_15",
        label = "Back"
      ),
      actionButton(
        inputId = "next_15",
        label = "Next"
      )
      
    ),
    
    ###
    tabPanel(
      "impact1",
      
    h1("Impact"),
    h4("Counterfactual"),
    p("What would have happened if the project had not been carried out?"),
    p("Add table"),
    actionButton(
      inputId = "back_16",
      label = "Back"
    ),
    actionButton(
      inputId = "next_16",
      label = "Next"
    )
    
    ),
    
    ###
    tabPanel(
      "impact2",
      
      h1("Impact"),
      h4("Counterfactual"),
      p("How was the baseline scenario assessed?"),
      p("Add table"),
      actionButton(
        inputId = "back_17",
        label = "Back"
      ),
      actionButton(
        inputId = "next_17",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "impact3",
      
      h1("Impact"),
      h4("Leakage"),
      p("Cool (and brief) explanation of leakage"),
      actionButton(
        inputId = "back_18",
        label = "Back"
      ),
      actionButton(
        inputId = "next_18",
        label = "Next"
      )
      
    ),
    
    ###
    tabPanel(
      "impact4",
        
      h1("Impact"),
      h4("Leakage"),
      p("What, if any, is the main source(s) of leakage for each outcome?"),
      p("Add table"),
      actionButton(
        inputId = "back_19",
        label = "Back"
      ),
      actionButton(
        inputId = "next_19",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "impact5",
      
      h1("Impact"),
      h4("Leakage"),
      p("What is the speculated intensity of each source of leakage?"),
      p("Add table"),
      actionButton(
        inputId = "back_20",
        label = "Back"
      ),
      actionButton(
        inputId = "next_20",
        label = "Next"
      )
      
    ),
    
    ###
    tabPanel(
      "impact6",
      
      h1("Impact"),
      h4("Attribution"),
      p("How much of the outcomes was caused by the contribution of other organizations or people?"),
      p("Add table"),
      actionButton(
        inputId = "back_21",
        label = "Back"
      ),
      actionButton(
        inputId = "next_21",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "results",
      
    h1("Results"),
    h4("For every $1 invested you get: Outcome 1 + Outcome 2 + …"),
    h4("ROI = Outcome 1 + Outcome 2 + … : $1"),
    p("Features of the analysis:
    - Costs: Direct/Indirect
    - Outcomes: 
        Intended/Unintended
        Future estimates (average time considered)
       Monetary valuation
    - Discount Rate
    - Counterfactual: Causal Inference
    - Leakage: Source/Intensity"),
    actionButton(
      inputId = "back_22",
      label = "Back"
    ),
    actionButton(
      inputId = "finish",
      label = "Finish"
    ),
    actionButton(
      inputId = "print",
      label = "Print Results"
    ),
    actionButton(
      inputId = "home",
      label = "Home"
    )
    
    ),
    
  )
  

  
)

server <- function(input, output, session) {
  
  ##
  
  result <- eventReactive(input$next_7 , {
    st <- as.numeric(format(as.Date(input$start, format="%Y/%m/%Yd"),"%Y"))
    fn <- as.numeric(format(as.Date(input$finish, format="%Y/%m/%Yd"),"%Y"))
    x <- (fn - st) + 1
    foo<-data.frame(matrix(ncol=3, nrow=x))
    colnames(foo)<-c('Year', 'a', 'Units')
    foo$a<-as.numeric(NA)
    foo$Year<-c(st:fn)
    colnames(foo)[2] <- input$outcome_indicator
    foo$Units <- input$units
    return(foo)
  })
  
  
  # returns rhandsontable type object - editable excel type grid data
  output$table <- renderRHandsontable({
    rhandsontable(result()) # converts the R dataframe to rhandsontable object
  })
  
  # on click of button the file will be saved to the working directory
  observeEvent(input$saveBtn, 
               write.csv(hot_to_r(input$table), file = "main_outcome.csv",row.names = FALSE))
  # hot_to_r() converts the rhandsontable object to r data object
  
  ##
  
  result1 <- eventReactive(input$next_10 , {
    st1 <- as.numeric(format(as.Date(input$start1, format="%Y/%m/%Yd"),"%Y"))
    fn1 <- as.numeric(format(as.Date(input$finish1, format="%Y/%m/%Yd"),"%Y"))
    x1 <- (fn1 - st1) + 1
    foo<-data.frame(matrix(ncol=3, nrow=x1))
    colnames(foo)<-c('Year', 'a', 'Units')
    foo$a<-as.numeric(NA)
    foo$Year<-c(st1:fn1)
    colnames(foo)[2] <- input$outcome_indicator1
    foo$Units <- input$units1
    return(foo)
  })
  
  
  # returns rhandsontable type object - editable excel type grid data
  output$table1 <- renderRHandsontable({
    rhandsontable(result1()) # converts the R dataframe to rhandsontable object
  })
  
  # on click of button the file will be saved to the working directory
  observeEvent(input$save_add_out1, 
               write.csv(hot_to_r(input$table1), file = "add_outcome1.csv",row.names = FALSE))
  # hot_to_r() converts the rhandsontable object to r data object
  
  ##
  result2 <- eventReactive(input$next_x , {
    st2 <- as.numeric(format(as.Date(input$start2, format="%Y/%m/%Yd"),"%Y"))
    fn2 <- as.numeric(format(as.Date(input$finish2, format="%Y/%m/%Yd"),"%Y"))
    x2 <- (fn2 - st2) + 1
    foo<-data.frame(matrix(ncol=3, nrow=x2))
    colnames(foo)<-c('Year', 'a', 'Units')
    foo$a<-as.numeric(NA)
    foo$Year<-c(st2:fn2)
    colnames(foo)[2] <- input$outcome_indicator2
    foo$Units <- input$units2
    return(foo)
  })
  
  
  output$table2 <- renderRHandsontable({
    rhandsontable(result2()) 
  })
  
  
  observeEvent(input$save_add_out2, 
               write.csv(hot_to_r(input$table2), file = "add_outcome2.csv",row.names = FALSE))

  
  ##
  #ESTO NO ANDA! RE-PENSARLO!!!

  result3 <- eventReactive(input$next_xx , {
    foo<-data.frame(matrix(ncol=2, nrow=3))
    colnames(foo)<-c('Value', 'Units')
    row.names(foo)[1] <- input$outcome_indicator
    row.names(foo)[2] <- input$outcome_indicator1
    row.names(foo)[3] <- input$outcome_indicator2
    foo$Value <- as.numeric(NA)
    foo$Units[1] <- input$units
    foo$Units[2] <- input$units1
    foo$Units[3] <- input$units2
    return(foo)
  })
  
  result3 <- eventReactive(input$no_add_other , {
    foo<-data.frame(matrix(ncol=2, nrow=2))
    colnames(foo)<-c('Value', 'Units')
    row.names(foo)[1] <- input$outcome_indicator
    row.names(foo)[2] <- input$outcome_indicator1
    foo$Value <- as.numeric(NA)
    foo$Units[1] <- input$units
    foo$Units[2] <- input$units1
    return(foo)
  })
  
  result3 <- eventReactive(input$no_add , {
    foo<-data.frame(matrix(ncol=2, nrow=1))
    colnames(foo)<-c('Value', 'Units')
    row.names(foo)[1] <- input$outcome_indicator
    foo$Value <- as.numeric(NA)
    foo$Units[1] <- input$units
    return(foo)
  })
  
  
  output$table3 <- renderRHandsontable({
    rhandsontable(result3()) 
  })
  
  
  observeEvent(input$save_mon_value, 
               write.csv(hot_to_r(input$table2), file = "mon_value.csv",row.names = FALSE))
  
  ##
  
  
  
  
  
  
  observeEvent(input$continue,{
    message("continue button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "intro")
  })
  
  observeEvent(input$skip_intro,{
    message("SKIP INTRO button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "general")
  })
  
  observeEvent(input$back_1,{
    message("Back (1) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "croi")
  })
  
  observeEvent(input$next_1,{
    message("Next (1) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "elements")
  })
  
  observeEvent(input$back_2,{
    message("Back (2) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "intro")
  })
  
  observeEvent(input$next_2,{
    message("Next (2) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "general")
  })
  
  observeEvent(input$back_3,{
    message("Back (3) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "elements")
  })
  
  observeEvent(input$next_3,{
    message("Next (3) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "inputs")
  })
  
  observeEvent(input$back_4,{
    message("Back (4) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "general")
  })
  
  observeEvent(input$next_4,{
    message("Next (4) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "inputs1")
  })
  
  observeEvent(input$back_5,{
    message("Back (5) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "inputs")
  })
  
  observeEvent(input$next_5,{
    message("Next (5) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes")
  })
  
  observeEvent(input$back_6,{
    message("Back (6) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "inputs1")
  })
  
  observeEvent(input$next_6,{
    message("Next (6) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes1")
  })
  
  observeEvent(input$back_7,{
    message("Back (7) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes")
  })
  
  observeEvent(input$next_7,{
    message("Next (7) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes2")
  })
  
  observeEvent(input$back_8,{
    message("Back (8) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes1")
  })
  
  observeEvent(input$next_8,{
    message("Next (8) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes3")
  })
  
  observeEvent(input$yes_add,{
    message("Yes (add additional outcome) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes4")
  })
  
  observeEvent(input$no_add,{
    message("No (add additional outcome) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes6")
  })
  
  observeEvent(input$back_9,{
    message("Back (9) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes2")
  })
  
  #observeEvent(input$next_9,{
    #message("Next (9) button was press")
    #updateTabsetPanel(session, "CROI_tabs", selected = "outcomes4")
  #})
  
  observeEvent(input$back_10,{
    message("Back (10) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes3")
  })
  
  observeEvent(input$next_10,{
    message("Next (10) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes5")
  })
  
  observeEvent(input$add_other,{
    message("Add a second additional outcome button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomesx")
  })
  
  observeEvent(input$no_add_other,{
    message("Continue without adding a second additional outcome button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes6")
  })
  
  observeEvent(input$back_x,{
    message("Back (X) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes5")
  })
  
  observeEvent(input$next_x,{
    message("Next (X) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomesxx")
  })
  observeEvent(input$back_xx,{
    message("Back (XX) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomesx")
  })
  
  observeEvent(input$next_xx,{
    message("Next (XX) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes6")
  })
  
  observeEvent(input$next_11,{
    message("Next (11) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes6")
  })
  
  observeEvent(input$back_11,{
    message("Back (11) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes4")
  })
  
  observeEvent(input$next_11,{
    message("Next (11) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes6")
  })
  
  observeEvent(input$back_12,{
    message("Back (12) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes3")
  })
  
  observeEvent(input$next_12,{
    message("Next (12) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes7")
  })
  
  
  observeEvent(input$back_13,{
    message("Back (13) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes6")
  })
  
  observeEvent(input$next_13,{
    message("Next (13) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes8")
  })
  
  observeEvent(input$back_14,{
    message("Back (14) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes7")
  })
  
  observeEvent(input$next_14,{
    message("Next (14) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact")
  })
  
  observeEvent(input$back_15,{
    message("Back (15) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes8")
  })
  
  observeEvent(input$next_15,{
    message("Next (15) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact1")
  })
  
  observeEvent(input$back_16,{
    message("Back (16) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact")
  })
  
  observeEvent(input$next_16,{
    message("Next (16) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact2")
  })
  
  observeEvent(input$back_17,{
    message("Back (17) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact1")
  })
  
  observeEvent(input$next_17,{
    message("Next (17) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact3")
  })
  
  observeEvent(input$back_18,{
    message("Back (18) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact2")
  })
  
  observeEvent(input$next_18,{
    message("Next (18) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact4")
  })
  
  observeEvent(input$back_19,{
    message("Back (19) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact3")
  })
  
  observeEvent(input$next_19,{
    message("Next (19) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact5")
  })
  
  observeEvent(input$back_20,{
    message("Back (20) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact4")
  })
  
  observeEvent(input$next_20,{
    message("Next (20) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact6")
  })
  
  observeEvent(input$back_21,{
    message("Back (21) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact5")
  })
  
  observeEvent(input$next_21,{
    message("Next (21) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "results")
  })
  
  observeEvent(input$back_22,{
    message("Back (22) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact6")
  })
  
  observeEvent(input$finish,{
    message("Finish button was press")
  })
  
  observeEvent(input$print,{
    message("Print Results button was press")
  })
  
  observeEvent(input$home,{
    message("Home button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "croi")
  })
  
}

shinyApp(ui, server)