# server.R

source("helpers.R")

shinyServer(
  function(input, output) {
  
  output$text_all_rsqrd <- renderText({
    fit_all <- lm(formula = grade ~ ., data = df_ed_grade_act_cons_res)
    summary(fit_all)$adj.r.squared
  })
  
  output$summary_all <- renderPrint({ 
    
    fit_all <- lm(formula = grade ~ ., data = df_ed_grade_act_cons_res)
    summary(fit_all)
  })
  
  output$text_preds <-renderText({
    input$var
  })
  
  output$text_preds_rsqrd <- renderText({
    the_fit <- fit_lm_to_preds( input$var )
    summary(the_fit)$adj.r.squared
  })
  
  output$summary_preds <- renderPrint({ 
    
    the_fit <- fit_lm_to_preds( input$var )
    summary(the_fit)
    
  }) 
  
  
  
} 

)