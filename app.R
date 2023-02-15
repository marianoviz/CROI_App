library(shiny)
library(rhandsontable)
library(shinyWidgets)
library(tidyverse)

ui <- fluidPage(
  
  tabsetPanel(
    id = "CROI_tabs",
    type = "hidden",
    
    ###
    tabPanel(
      "croi",
      h1(style='text-align:center;',"C-ROI"),
      h2(style='text-align:center;',"Conservation Return on Investment"),
      br(),
      h4(style='text-align:center;',"An analytical tool for evaluating conservation investments"), 
      br(),
      hr(),
      p(em("Developed by"),br("Christopher Costello and Mariano Viz"),style="text-align:center;"),
      hr(),
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
      hr(),
      div(img(src = "video.png", height = "60%", width = "60%"), style="text-align: center;"),
 
      hr(),
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
      
      h1("Elements of ROI analysis"),
      hr(),
      h2("Theory of change", style="text-align: center;"),
      br(),
      div(img(src = "toc.png", height = "60%", width = "60%"), style="text-align: center;"),
      br(),
      p(style="text-align: center;", em("[Inputs] and [Activities] produce [Outputs] leading to [Outcomes] that, if [Impactful], ultimately contribute to [Goal]")),
      br(),
      hr(),
      h3("ROI is simply a ratio of benefits (Outcomes x Impact) to costs (Inputs)", style="text-align: center;"),
      hr(),
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
      
      h1("General Information"),
      hr(),
      textInput("organization", label = h3("Organization"), value = "Enter text..."),
      textInput("program", label = h3("Program/Project"), value = "Enter text..."),
      hr(),
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
      hr(),
      #h5("Which costs will you consider in the analysis?"),
      h4("Inputs are the costs required to carry out the project or program (funding, staffing, equipment, etc.)"),
     
      hr(),
      
      div(
        class = "input-group",
        tags$span(
          style = "display: inline-block",
          checkboxGroupInput("costs", label = h5("Which costs will you consider in the analysis?"), 
                             choices = list("Direct" = "Direct", "Indirect" = "and Indirect"),
                             selected = "Direct")
        ),
        tags$span(
          style = "vertical-align: top;",
          actionButton("b", "", icon = icon("question"))
        )
      ),
      
      
      
      hr(),
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
      hr(),
      h4("List all significant costs incurred on the project"),
      br(),
      
      
      div(
        class = "input-group",
        tags$span(
          style = "display: inline-block",
          rHandsontableOutput("table0")
        ),
        tags$span(
          style = "vertical-align: top;",
          actionButton("b1", "", icon = icon("question"))
        )
      ),
      actionButton("save_inputs","Save"),
      br(),
      br(),
      p(em("Note: the table can be manipulated like an Excel or Google Sheets table (e.g. additional cells can be added by right-clicking)")),
      
      hr(),
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
    hr(),
    h4("Outcomes are the changes that result from the project or program activities and outputs"),
    br(),
    div(img(src = "outcomes.png", height = "40%", width = "40%"), style="text-align: center;"),
    hr(),
    
    
    div(
      class = "input-group",
      tags$span(
        style = "display: inline-block",
        checkboxGroupInput("outcomes_opt", label = h5("What outcomes will be taken into account?"), 
                           choices = list("Intended" = "Intended", "Unintended" = "and Unintended"),
                           selected = "Intended")
      ),
      tags$span(
        style = "vertical-align: top;",
        actionButton("b2", "", icon = icon("question"))
      )
    ),
    
    
    
    
    hr(),
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
      
      h1("Main Outcome"),
      hr(),
      h4("Specify the main outcome of the project, one outcome indicator, and the period in which the outcome is obtained"),
      hr(),
      #p("Are there any additional outcomes you want to add? (select up to 2 additional outcomes)"),
      
      ##
      textInput("main_outcome", label = h4("Main Outcome"), value = "Enter text..."),
      hr(),
      
      div(
        class = "input-group",
        tags$span(
          style = "display: inline-block",
          textInput("outcome_indicator", label = h4("Outcome Indicator"), value = "Enter text...")
        ),
        tags$span(
          style = "vertical-align: top;",
          actionButton("b3", "", icon = icon("question"))
        )
      ),
      
      
      textInput("units", label = h5("Units"), value = "Enter text..."),
      hr(),
      
      airDatepickerInput("start",
                         label = "Start",
                         value = "2022",
                         maxDate = "2050",
                         minDate = "1900",
                         view = "years", 
                         minView = "years", 
                         dateFormat = "yyyy"
      ),
      
      div(
        class = "input-group",
        tags$span(
          style = "display: inline-block",
          airDatepickerInput("finish",
                             label = "Finish",
                             value = "2022",
                             maxDate = "2300",
                             minDate = "1900",
                             view = "years", 
                             minView = "years", 
                             dateFormat = "yyyy"
          )
        ),
        tags$span(
          style = "vertical-align: top;",
          actionButton("b4", "", icon = icon("question"))
        )
      ),
      
      
      hr(),
      
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
      
      h1("Main Outcome"),
      hr(),
      h4("Fill in the outcome data"),
      #p("When does each outcome start?"),
      #p("Add table"),
     
      ##
      
      #helpText(verbatimTextOutput("value")),
      rHandsontableOutput("table"),
      br(),
      actionButton("saveBtn","Save"),
      br(),
      hr(),
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
      
      h1("Additional Outcomes"),
      hr(),
      h4("Are there any additional outcomes you would like to add?", em("(you can specify up to 2 additional outcomes)")),
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
      hr(),
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
      
      h1("Additional Outcome #1"),
      hr(),
      #p("Choose one indicator for each of the outcomes"),
      
      ##
      
      textInput("add_outcome1", label = h4("Additional Outcome #1"), value = "Enter text..."),
      hr(),
      textInput("outcome_indicator1", label = h4("Outcome Indicator"), value = "Enter text..."),
      textInput("units1", label = h5("Units"), value = "Enter text..."),
      hr(),
      
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
      hr(),
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
      
      h1("Additional Outcome #1"),
      hr(),
      h4("Fill in the outcome data"),
      #p("What is the measured/predicted value of each outcome indicator?"),
      #p("Add table"),
      
      ##
      #helpText(verbatimTextOutput("value")),
      rHandsontableOutput("table1"),
      br(),
      actionButton("save_add_out1","Save"),
      br(),
      hr(),
      
      
      
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
      )
      #actionButton(
        #inputId = "next_11",
        #label = "Next"
      #)
    
    ),
    
    ###
    tabPanel(
      "outcomesx",
      
      h1("Additional Outcome #2"),
      hr(),
      #p("x"),
      
      ##
      
      textInput("add_outcome2", label = h4("Additional Outcome #2"), value = "Enter text..."),
      hr(),
      textInput("outcome_indicator2", label = h4("Outcome Indicator"), value = "Enter text..."),
      textInput("units2", label = h5("Units"), value = "Enter text..."),
      hr(),
      
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
      hr(),
      
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
      
      h1("Additional Outcome #2"),
      hr(),
      h4("Fill in the outcome data"),
      #p("xx"),
      
      ##
      #helpText(verbatimTextOutput("value")),
      rHandsontableOutput("table2"),
      br(),
      actionButton("save_add_out2","Save"),
      br(),
      hr(),
      
      
      
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
      
      h1("Monetary Valuation"),
      hr(),
      h4("Will any of the outcomes be valued in monetary equivalents?"),
      actionButton(
        inputId = "yes_mon",
        label = "Yes"
      ),
      actionButton(
        inputId = "no_mon",
        label = "No"
      ),
      br(),
      br(),
      hr(),
      
      actionButton(
        inputId = "back_12",
        label = "Back"
      )
      #actionButton(
        #inputId = "next_12",
        #label = "Next"
      #)
    
    ),
    
    ###
    tabPanel(
      "outcomes7",
      
      h1("Monetary Valuation"),
      hr(),
      #p("Select the outcome(s) to be valued in monetary equivalents:"),
      #p("Add checkbox"),
      
      div(
        class = "input-group",
        tags$span(
          style = "display: inline-block",
          h4("What is the value (per unit) of the monetized outcome?")
        ),
        tags$span(
          style = "vertical-align: top;",
          actionButton("b5", "", icon = icon("question"))
        )
      ),
      
      
      
      rHandsontableOutput("table3"),
      br(),
      actionButton("save_mon_value","Save"),
      br(),
      hr(),
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
      
      h1("Discount Rate"),
      hr(),
      
      div(
        class = "input-group",
        tags$span(
          style = "display: inline-block",
          numericInput("dr", label = h4("What will be the discount rate (%) used to calculate the present value of the outcomes?"), value = 3.5)
        ),
        tags$span(
          style = "vertical-align: bottom;",
          actionButton("b6", "", icon = icon("question"))
        )
      ),
      
      
      
      hr(),
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
      h3("Counterfactual"),
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
    hr(),
    
    div(
      class = "input-group",
      tags$span(
        style = "display: inline-block",
        h3("Baseline")
      ),
      tags$span(
        style = "vertical-align: middle;",
        actionButton("b7", "", icon = icon("question"))
      )
    ),
    
    
    p("Outcomes are judged in relation to the baseline conditions (current and future) that would prevail if the investments were not made. That is, ROI analysis requires the measurement or prediction of those baseline conditions."),
    
    hr(),
    h4("What would have happened if the project had not been carried out?"),
    rHandsontableOutput("table4"),
    actionButton("save_cf_main","Save"),
    br(),
    br(),
    conditionalPanel(condition = "input.outcome_indicator1 != 'Enter text...' ", rHandsontableOutput("table5")),
    conditionalPanel(condition = "input.outcome_indicator1 != 'Enter text...' ", actionButton("save_cf_add1","Save")),
    br(),
    conditionalPanel(condition = "input.outcome_indicator2 != 'Enter text...' ", rHandsontableOutput("table6")),
    conditionalPanel(condition = "input.outcome_indicator2 != 'Enter text...' ", actionButton("save_cf_add2","Save")),
    hr(),
    div(
      class = "input-group",
      tags$span(
        style = "display: inline-block",
        h3("Causal inference")
      ),
      tags$span(
        style = "vertical-align: middle;",
        actionButton("b8", "", icon = icon("question"))
      )
    ),
    
    
    
    h4("How was the baseline scenario assessed?"),
    selectInput("ci_main", label = h5("Main Outcome"), 
                choices = list("Randomized Controlled Trial" = "Randomized Controlled Trial", 
                               "Regression discontinuity" = "Regression discontinuity", 
                               "Differences in differences" = "Differences in differences",
                               "Instrumental variables" = "Instrumental variables",
                               "Synthetic control" = "Synthetic control",
                               "Control site" = "Control site",
                               "Before vs. After" = "Before vs. After",
                               "Enrolled vs. Unenrolled" = "Enrolled vs. Unenrolled",
                               "Other" = "Other"), 
                selected = "Control site"),
    conditionalPanel(condition = "input.outcome_indicator1 != 'Enter text...' ", selectInput("ci_add1", label = h5("Additional Outcome #1"), 
                                                                                             choices = list("Randomized Controlled Trial" = "Randomized Controlled Trial", 
                                                                                                            "Regression discontinuity" = "Regression discontinuity", 
                                                                                                            "Differences in differences" = "Differences in differences",
                                                                                                            "Instrumental variables" = "Instrumental variables",
                                                                                                            "Synthetic control" = "Synthetic control",
                                                                                                            "Control site" = "Control site",
                                                                                                            "Before vs. After" = "Before vs. After",
                                                                                                            "Enrolled vs. Unenrolled" = "Enrolled vs. Unenrolled",
                                                                                                            "Other" = "Other"), 
                                                                                             selected = "Control site")),
    conditionalPanel(condition = "input.outcome_indicator2 != 'Enter text...' ", selectInput("ci_add2", label = h5("Additional Outcome #2"), 
                                                                                             choices = list("Randomized Controlled Trial" = "Randomized Controlled Trial", 
                                                                                                            "Regression discontinuity" = "Regression discontinuity", 
                                                                                                            "Differences in differences" = "Differences in differences",
                                                                                                            "Instrumental variables" = "Instrumental variables",
                                                                                                            "Synthetic control" = "Synthetic control",
                                                                                                            "Control site" = "Control site",
                                                                                                            "Before vs. After" = "Before vs. After",
                                                                                                            "Enrolled vs. Unenrolled" = "Enrolled vs. Unenrolled",
                                                                                                            "Other" = "Other"), 
                                                                                             selected = "Control site")),
    hr(),
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
      h3("Leakage"),
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
      hr(),
      div(
        class = "input-group",
        tags$span(
          style = "display: inline-block",
          h3("Leakage")
        ),
        tags$span(
          style = "vertical-align: middle;",
          actionButton("b9", "", icon = icon("question"))
        )
      ),
      
      
      p("Leakage refers to the unintended displacements that the project may generate (e.g. relocation of some extractive activities)."),
      hr(),
      h4("What, if any, is the main source of leakage for each outcome?"),
      
      textInput("leak_main", label = h5("Main Outcome"), value = "Enter text..."),
      conditionalPanel(condition = "input.outcome_indicator1 != 'Enter text...' ", textInput("leak_add1", label = h5("Additional Outcome #1"), value = "Enter text...")),
      conditionalPanel(condition = "input.outcome_indicator2 != 'Enter text...' ", textInput("leak_add2", label = h5("Additional Outcome #2"), value = "Enter text...")),
      hr(),
      
      h4("What is the speculated intensity of each source of leakage?"),
      
      conditionalPanel(condition = "input.leak_main != 'Enter text...' ", selectInput("leak_main_src", label = h5("Main Outcome"), 
                                                                                      choices = list("Low" = "Low", "Medium" = "Medium", "High" = "High"), 
                                                                                      selected = "Medium")),
      conditionalPanel(condition = "input.leak_add1 != 'Enter text...' ", selectInput("leak_add1_src", label = h5("Additional Outcome #1"), 
                                                                                      choices = list("Low" = "Low", "Medium" = "Medium", "High" = "High"), 
                                                                                      selected = "Medium")),
      conditionalPanel(condition = "input.leak_add2 != 'Enter text...' ", selectInput("leak_add2_src", label = h5("Additional Outcome #2"), 
                                                                                      choices = list("Low" = "Low", "Medium" = "Medium", "High" = "High"), 
                                                                                      selected = "Medium")),

      
      hr(),
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
      h3("Leakage"),
      
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
      hr(),
      div(
        class = "input-group",
        tags$span(
          style = "display: inline-block",
          h3("Attribution")
        ),
        tags$span(
          style = "vertical-align: middle;",
          actionButton("b10", "", icon = icon("question"))
        )
      ),
      
      p("Attribution is a subjective measure of how much of the change achieved is the responsibility of the assessed organization (or other organizations/individuals)."),
      hr(),
      
      #h3(textOutput("pv_main")),
      
      sliderInput("slider1", label = h5("How much of the Main Outcomes was caused by the contribution of other organizations or people?"), min = 0, 
                  max = 100, value = 50),
      h5("Present Value of Main Outcome:", textOutput("pv_main_at")),
      hr(),
      
      #conditionalPanel(condition = "input.outcome_indicator1 != 'Enter text...' ", h3(textOutput("pv_add1"))),
      conditionalPanel(condition = "input.outcome_indicator1 != 'Enter text...' ", sliderInput("slider2", label = h5("How much of the Additional Outcomes #1 was caused by the contribution of other organizations or people?"), min = 0, 
                                                                                               max = 100, value = 50)),
      conditionalPanel(condition = "input.outcome_indicator1 != 'Enter text...' ", h5("Present Value of Additional Outcome #1:", textOutput("pv_add1_at"))),
      hr(),
      #conditionalPanel(condition = "input.outcome_indicator2 != 'Enter text...' ", h3(textOutput("pv_add2"))),
      conditionalPanel(condition = "input.outcome_indicator2 != 'Enter text...' ", sliderInput("slider3", label = h5("How much of the Additional Outcomes #2 was caused by the contribution of other organizations or people?"), min = 0, 
                                                                                               max = 100, value = 50)),
      conditionalPanel(condition = "input.outcome_indicator2 != 'Enter text...' ", h5("Present Value of Additional Outcome #2:", textOutput("pv_add2_at"))),
      br(),
      hr(),
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
    hr(),
    #h3(textOutput("pv_inputs")),
    #h3(textOutput("roi_main")),
    h3("For every $1 invested you get:"),
    h4(textOutput("roi_main_r")),
    conditionalPanel(condition = "input.outcome_indicator1 != 'Enter text...' ", h4(textOutput("roi_add1_r"))),
    conditionalPanel(condition = "input.outcome_indicator2 != 'Enter text...' ", h4(textOutput("roi_add2_r"))),
    hr(),
    h4(htmlOutput("roi_added")),
    hr(),
    h4("Features of the analysis:"),
    p(textOutput("cost_considered")), #review!
    p(textOutput("out_considered")), #review!
    p(textOutput("dr_considered")),
    p(htmlOutput("ci")),
    conditionalPanel(condition = "input.leak_main != 'Enter text...' ", p(textOutput("leakage_main"))),
    conditionalPanel(condition = "input.leak_add1 != 'Enter text...' ", p(textOutput("leakage_add1"))),
    conditionalPanel(condition = "input.leak_add2 != 'Enter text...' ", p(textOutput("leakage_add2"))),
    
    #p("(Outcomes: Future estimates (average time considered), Monetary valuation"),
    hr(),
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
    
    )
    
  )
  

  
)

server <- function(input, output, session) {
  
  
  observeEvent(input$b, {
    showModal(modalDialog(
      title = "Direct and Indirect costs",
      p("Direct costs:",
        br("Indirect costs: ")),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  observeEvent(input$b1, {
    showModal(modalDialog(
      title = "Listing Costs",
      p("Valuing non-monetized inputs",
        br("Note on doble-counting inputs")),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  observeEvent(input$b2, {
    showModal(modalDialog(
      title = "Intended and Unintended outcomes",
      p("Intended outcomes:",
        br("Unintended outcomes: ")),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  observeEvent(input$b3, {
    showModal(modalDialog(
      title = "Outcome indicator",
      p("Outcome indicator:"),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  observeEvent(input$b4, {
    showModal(modalDialog(
      title = "Future outcomes",
      p("Note on future benefits"),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  observeEvent(input$b5, {
    showModal(modalDialog(
      title = "Monetary Valuation",
      p("Monetary valuation basics"),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  
  observeEvent(input$b6, {
    showModal(modalDialog(
      title = "Discount Rate",
      p("Rationale behind the 3.5% discount rate"),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  observeEvent(input$b7, {
    showModal(modalDialog(
      title = "Baseline/Counterfactual",
      p("More in depth explanation of Baseline/Counterfactual"),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  
  observeEvent(input$b8, {
    showModal(modalDialog(
      title = "Causal Inference",
      p("Causal inference explanation"),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  
  observeEvent(input$b9, {
    showModal(modalDialog(
      title = "Leakage",
      p("More in depth explanation of leakage"),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  observeEvent(input$b10, {
    showModal(modalDialog(
      title = "Attribution",
      p("Description of attribution (reach an agreement with other stakeholders)"),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  ##
  
  
  output$cost_considered <- renderText({
    paste("Costs considered:", input$costs) #review!
  })
  
  
  output$out_considered <- renderText({
    paste("Outcomes considered:", input$outcomes_opt) #review!
  })
  
  output$dr_considered <- renderText({
    paste("Discount rate:", input$dr, "%") 
  })
  
  output$ci <- renderUI({
    str1 <- paste(input$ci_main)
    str2 <- paste(input$ci_add1)
    str3 <- paste(input$ci_add2)
    HTML(
      if (input$outcome_indicator2!="Enter text...") {
        paste("Causal inference methodology:", str1, ",", str2, ",", str3)
      } else if (input$outcome_indicator1!="Enter text..." ) {
        paste("Causal inference methodology:",str1, ",", str2)
      } else
        paste("Causal inference methodology:", str1)
    )
  })
  
  output$leakage_main <- renderText({
    paste("Main Outcome leakage:", input$leak_main, "(", input$leak_main_src, ")")
    
    })
  
  output$leakage_add1 <- renderText({
    paste("Additional Outcome #1 leakage:", input$leak_add1, "(", input$leak_add1_src, ")")
  })
  
  output$leakage_add2 <- renderText({
    paste("Additional Outcome #2 leakage:",input$leak_add2, "(", input$leak_add2_src, ")")
  })
  
  
  
  ##
  
  result0 <- eventReactive(input$next_4 , {
    foo<-data.frame(matrix(ncol=3, nrow=10))
    colnames(foo)<-c('Year', 'Cost', 'a')
    foo$a<-as.numeric(NA)
    foo$Year<-format(as.Date(NA, format="%Y/%m/%Yd"),"%Y")
    foo$Cost<-as.character(NA) 
    colnames(foo)[3] <- "Value ($)"
    return(foo)
  })
  
  
  output$table0 <- renderRHandsontable({
    rhandsontable(result0()) 
  })
  
  
  observeEvent(input$save_inputs, 
               write.csv(hot_to_r(input$table0), file = "inputs.csv",row.names = FALSE))
  
  
  
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

  result3 <- eventReactive(input$yes_mon , {
    foo<-data.frame(matrix(ncol=3, nrow=3))
    colnames(foo)<-c('Indicator', 'Units', 'Value')
    foo$Indicator[1] <- input$outcome_indicator
    foo$Indicator[2] <- input$outcome_indicator1
    foo$Indicator[3] <- input$outcome_indicator2
    foo$Value <- as.numeric(NA)
    colnames(foo)[3] <- " Value ($/unit)"
    foo$Units[1] <- input$units
    foo$Units[2] <- input$units1
    foo$Units[3] <- input$units2
    foo<- subset(foo, Units!="Enter text..." & Indicator!="Enter text...")
    return(foo)
  })
  
  
  output$table3 <- renderRHandsontable({
    rhandsontable(result3())
  })
  
  observeEvent(input$save_mon_value, 
               write.csv(hot_to_r(input$table3), file = "mon_value.csv",row.names = FALSE))
  
  ##
  
  result4 <- eventReactive(input$saveBtn , {
    foo<-read.csv("main_outcome.csv")
    foo$Baseline<- as.numeric(NA)
    return(foo)
  })
  
  
  output$table4 <- renderRHandsontable({
    rhandsontable(result4())
  })
  
  observeEvent(input$save_cf_main, 
               write.csv(hot_to_r(input$table4), file = "cf_main.csv",row.names = FALSE))
  
  
  
  result5 <- eventReactive(input$save_add_out1 , {
    foo<-read.csv("add_outcome1.csv")
    foo$Baseline<- as.numeric(NA)
    return(foo)
  })
  
  
  output$table5 <- renderRHandsontable({
    rhandsontable(result5())
  })
  
  observeEvent(input$save_cf_add1, 
               write.csv(hot_to_r(input$table5), file = "cf_add1.csv",row.names = FALSE))
  
  
  result6 <- eventReactive(input$save_add_out2 , {
    foo<-read.csv("add_outcome2.csv")
    foo$Baseline<- as.numeric(NA)
    return(foo)
  })
  
  
  output$table6 <- renderRHandsontable({
    rhandsontable(result6())
  })
  
  observeEvent(input$save_cf_add2, 
               write.csv(hot_to_r(input$table6), file = "cf_add2.csv",row.names = FALSE))
  
  ##

  
  result7 <- eventReactive(input$next_16 , {
    foo<-read.csv("cf_main.csv")
    colnames(foo)<-c('year', 'indicator', 'units', 'baseline')
    df<-read.csv("inputs.csv")
    df <- na.omit(df)
    yr <- min(df$Year)
    dr<-input$dr/100
    foo$dr<- dr
    foo$period<- foo$year-yr
    foo$benefit <- foo$indicator-foo$baseline
    foo$disc_benefit <- foo$benefit/(1+dr)^foo$period
    pv<- sum(foo$disc_benefit)
    return(pv)
  })
  
  output$pv_main <- renderText({
    round(result7(), 2)
    })
  output$value <- renderPrint({ 
    input$slider1 
    })
  
  result8 <- eventReactive(input$slider1, {
    r <- round(result7(), 2)
    i <-input$slider1
    at <- r*(100-i)/100
    return(at)
    }) 
    
    output$pv_main_at <- renderText({
      paste(round(result8(), 2), input$units, "(", input$outcome_indicator, ")")
    })
  
  
  ##
    result7_add1 <- eventReactive(input$next_16 , {
      foo<-read.csv("cf_add1.csv")
      colnames(foo)<-c('year', 'indicator', 'units', 'baseline')
      df<-read.csv("inputs.csv")
      df <- na.omit(df)
      yr <- min(df$Year)
      dr<-input$dr/100
      foo$dr<- dr
      foo$period<- foo$year-yr
      foo$benefit <- foo$indicator-foo$baseline
      foo$disc_benefit <- foo$benefit/(1+dr)^foo$period
      pv<- sum(foo$disc_benefit)
      return(pv)
    })
    
    output$pv_add1 <- renderText({
      round(result7_add1(), 2)
    })
    #output$value <- renderPrint({ 
      #input$slider2 
    #})
    
    result8_add1 <- eventReactive(input$slider2, {
      r <- round(result7_add1(), 2)
      i <-input$slider2
      at <- r*(100-i)/100
      return(at)
    }) 
    
    output$pv_add1_at <- renderText({
      paste(round(result8_add1(), 2), input$units1, "(", input$outcome_indicator1, ")")
    })
    
  ##
    
    result7_add2 <- eventReactive(input$next_16 , {
      foo<-read.csv("cf_add2.csv")
      colnames(foo)<-c('year', 'indicator', 'units', 'baseline')
      df<-read.csv("inputs.csv")
      df <- na.omit(df)
      yr <- min(df$Year)
      dr<-input$dr/100
      foo$dr<- dr
      foo$period<- foo$year-yr
      foo$benefit <- foo$indicator-foo$baseline
      foo$disc_benefit <- foo$benefit/(1+dr)^foo$period
      pv<- sum(foo$disc_benefit)
      return(pv)
    })
    
    output$pv_add2 <- renderText({
      round(result7_add2(), 2)
    })
    
    #output$value <- renderPrint({ 
      #input$slider3 
    #})
    
    result8_add2 <- eventReactive(input$slider3, {
      r <- round(result7_add2(), 2)
      i <-input$slider3
      at <- r*(100-i)/100
      return(at)
    }) 
    
    output$pv_add2_at <- renderText({
      paste(round(result8_add2(), 2), input$units2, "(", input$outcome_indicator2, ")")
    }) 
    
    
    
    
    
    
    
    
  ##
    
    pv_inputs <- eventReactive(input$next_21 , {
      foo<-read.csv("inputs.csv")
      foo <- na.omit(foo)
      colnames(foo)<-c('year', 'input', 'value')
      yr <- min(foo$year)
      dr <-input$dr/100
      foo$dr <- dr
      foo$period<- foo$year-yr
      foo$disc_value <- foo$value/(1+dr)^foo$period
      pv<- sum(foo$disc_value)
      return(pv)
    })  
    
    output$pv_inputs <- renderText({
      pv_inputs()
    })
    
    roi_main <- eventReactive(input$slider1, {
      pv_main <- result8()
      pv_input <- pv_inputs()
      roi <- pv_main/pv_input
      return(roi)
    }) 
    
    roi_add1 <- eventReactive(input$slider2, {
      pv_add1 <- result8_add1()
      pv_input <- pv_inputs()
      roi <- pv_add1/pv_input
      return(roi)
    }) 
    
    roi_add2 <- eventReactive(input$slider3, {
      pv_add2 <- result8_add2()
      pv_input <- pv_inputs()
      roi <- pv_add2/pv_input
      return(roi)
    }) 
    
   output$roi_main_r <- renderText({
     paste("-", input$outcome_indicator,":", round(roi_main(), 2), input$units )
    })
   
   output$roi_add1_r <- renderText({
     paste("-", input$outcome_indicator1,":", round(roi_add1(), 2), input$units1 )
   })
   
   output$roi_add2_r <- renderText({
     paste("-", input$outcome_indicator2,":", round(roi_add2(), 2), input$units2 )
   })
    
    output$roi_added <- renderUI({
      str1 <- paste(round(roi_main(), 2), input$units, "(", input$outcome_indicator, ")")
      str2 <- paste(round(roi_add1(), 2), input$units1, "(", input$outcome_indicator1, ")")
      str3 <- paste(round(roi_add2(), 2), input$units2, "(", input$outcome_indicator2, ")")
      HTML(
        if (input$outcome_indicator2!="Enter text...") {
          paste("ROI =", str1, "+", str2, "+", str3, ": 1$")
        } else if (input$outcome_indicator1!="Enter text..." ) {
          paste("ROI =",str1, "+", str2, ": 1$")
        } else
          paste("ROI =", str1, ": 1$")
        )
    })
    
    
    

    
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
  
  observeEvent(input$yes_mon,{
    message("Yes (monetary valuation) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes7")
  })
  
  observeEvent(input$no_mon,{
    message("No (monetary valuation) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes8")
  })
  
  observeEvent(input$back_12,{
    message("Back (12) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes3")
  })
  
  #observeEvent(input$next_12,{
    #message("Next (12) button was press")
    #updateTabsetPanel(session, "CROI_tabs", selected = "outcomes7")
  #})
  
  
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
    updateTabsetPanel(session, "CROI_tabs", selected = "impact1")
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
    updateTabsetPanel(session, "CROI_tabs", selected = "outcomes8")
  })
  
  observeEvent(input$next_16,{
    message("Next (16) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact4")
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
    updateTabsetPanel(session, "CROI_tabs", selected = "impact1")
  })
  
  observeEvent(input$next_19,{
    message("Next (19) button was press")
    updateTabsetPanel(session, "CROI_tabs", selected = "impact6")
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
    updateTabsetPanel(session, "CROI_tabs", selected = "impact4")
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