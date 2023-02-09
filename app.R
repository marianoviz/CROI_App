library(shiny)

ui <- fluidPage(
  
  tabsetPanel(
    id = "CROI_tabs",
    type = "hidden",
    
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
      p("Specify the main outcome of the project"),
      p("Are there any additional outcomes you want to add? (select up to 2 additional outcomes)"),
      p("Add table"),
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
      p("When does each outcome start?"),
      p("Add table"),
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
      p("What is the expected duration of each outcome?"),
      p("Add table"),
      actionButton(
        inputId = "back_9",
        label = "Back"
      ),
      actionButton(
        inputId = "next_9",
        label = "Next"
      )
    
    ),
    
    ###
    tabPanel(
      "outcomes4",
      
      h1("Outcomes"),
      p("Choose one indicator for each of the outcomes"),
      p("Add table"),
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
      actionButton(
        inputId = "back_11",
        label = "Back"
      ),
      actionButton(
        inputId = "next_11",
        label = "Next"
      )
    
    ),
    
    ###
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
      p("Add table"),
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
  
  observeEvent(input$back_9,{
    message("Back (9) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes2")
  })
  
  observeEvent(input$next_9,{
    message("Next (9) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes4")
  })
  
  observeEvent(input$back_10,{
    message("Back (10) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes3")
  })
  
  observeEvent(input$next_10,{
    message("Next (10) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes5")
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
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes5")
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