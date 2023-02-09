library(shiny)

ui <- fluidPage(
  h1("C-ROI"),
  p("An analytical tool for evaluating conservation investments"), 
  actionButton(
    inputId = "continue",
    label = "Continue"
  ),
  actionButton(
    inputId = "skip_intro",
    label = "SKIP INTRO"
  ),
  
  ###
  
  h1("Introduction"),
  p("Cool (and brief) explanation of the ROI analysis"),
  img(src = "video.png", height = "100%", width = "100%"),
  actionButton(
    inputId = "back_1",
    label = "Back"
  ),
  actionButton(
    inputId = "next_1",
    label = "Next"
  ),
  
  ###
  
  h1("Elements of the analysis"),
  h4("Theory of change"),
  img(src = "toc.png", height = "100%", width = "100%"),
  p("If [inputs] and [activities] produce [outputs] this should lead to [outcomes] which, if [impactful], will ultimately contribute to [goal]."),
  actionButton(
    inputId = "back_2",
    label = "Back"
  ),
  actionButton(
    inputId = "next_2",
    label = "Next"
  ),
  
  ###
  
  h1("General"),
  p("Add text boxes"),
  actionButton(
    inputId = "back_3",
    label = "Back"
  ),
  actionButton(
    inputId = "next_3",
    label = "Next"
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
  h1("Outcomes"),
  img(src = "outcomes.png", height = "100%", width = "100%"),
  p("What outcomes will be taken into account?"),
  p("Add checkbox"),
  actionButton(
    inputId = "back_6",
    label = "Back"
  ),
  actionButton(
    inputId = "next_6",
    label = "Next"
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
  
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
  ),
  
  ###
 
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

server <- function(input, output, session) {
  
}

shinyApp(ui, server)