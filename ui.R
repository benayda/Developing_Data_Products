# ui.R

shinyUI(fluidPage(
  titlePanel("Predicting Online Learners' Grades Based on Activity Indicators"),
  
  sidebarLayout(
    sidebarPanel(
      img(src = "mitx-harvardx-course-icon-all_small.png", height = 50, width = 50),
      h4("Instructions:"),
      p("The app starts by reading in the HarvardX-MITx Person-Course Dataset AY2013, which contains 641,138 records, 
        and takes approximately 45-50 seconds to load, so your patience is much appreciated."),
      p(strong(em("Please wait till you see initial model results displayed in the main panel before selecting activity indicators for your new model.", style="color:purple"))),
      p("Select one or more predictors by clicking on their boxes. Deselect a predictor by clicking on its check mark. 
      Once you've made your selections, please press Submit."),
      p("After you view the results, construct a new model by clicking on checkboxes to select the new predictor(s) and clicking on check marks to
      deselect predictor(s). Then press Submit again to see how well the new indicator(s) predict learners' grades."),
      
      
      div(
      checkboxGroupInput("var", 
                  label = "Select Predictors: ",
                  choices = list("Number of Interactions with Course (nevents)" = "nevents",
                                  "Number of Active Days (ndays_act)" = "ndays_act", 
                                  "Number of Videos Played (nplay_video)" = "nplay_video",
                                  "Number of Chapters Viewed (nchapters)" = "nchapters", 
                                  "Number of Forum Posts (nforum_posts)" = "nforum_posts"),
                  selected = "nevents"),
      style = "color:green"
      ),
                                                                                     
      submitButton('Submit')
  
    ),

    mainPanel(
      
      h4("Description:"),
      p("This Shiny app allows you to select indicators of online course activity to explore how well these activities predict learners' grades."), 
      h4("Operation:"),
      p("After reading in and cleaning the data, the app builds an initial model, with nevents as the predictor. Then the app builds a model using the indicator(s) you select."),
      p("The app then calculates and displays the adjusted R-squared value and summary of
        the model using selected activity indicators as predictor variables. For comparison purposes, the app also calculates and displays
        the adjusted R-squared value and summary for a model using all five activity indicators as predictors."),
      p("To explore how well different course activities predict learners' grades, you can build additional models by selecting different activity indicators as predictor variables."),
      
      div(
      h4("Selected predictor(s):"),
      textOutput("text_preds"),
      h4("The adjusted R-squared value for selected predictor(s) is: "),
      textOutput("text_preds_rsqrd"),
      h5("The adjusted R-squared value indicates how much of the variability in learners' grades can be explained using the selected predictor variable(s) in the model."),
      h4("Summary for a Linear Model with selected predictor(s):"),
      verbatimTextOutput("summary_preds"),
      style = "color:green"
      ),
      
      br(),
      h4("The adjusted R-squared value for all five predictors is: "),
      textOutput("text_all_rsqrd"),
      h4("Summary for a Linear Model with all five predictors:"),
      verbatimTextOutput("summary_all")
      
  )
)
)
)