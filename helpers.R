# helpers.R

# Data Processing and Cleaning

df_ed <- read.csv("./data/HMXPC13_DI_v2_5-14-14.csv")

# Take some columns out of data frame since they're not needed for prediction
df_ed1 <- df_ed [, -c(7:10, 12, 13, 19)]

# Make a data frame with grade, 5 indicators of activity, and data flag indicating inconsistency
df_ed_grade_act <- df_ed1 [, c(7, 8:13)]
df_ed_grade_act_cons <- df_ed_grade_act[(is.na(df_ed_grade_act$incomplete_flag)), ]
df_ed_grade_act_cons_res <- df_ed_grade_act_cons[ , -c(7)]

# Clean data, convert NA's to 0
df_ed_grade_act_cons_res$grade[is.na(df_ed_grade_act_cons_res$grade)] <- 0
df_ed_grade_act_cons_res$nevents[is.na(df_ed_grade_act_cons_res$nevents)] <- 0
df_ed_grade_act_cons_res$ndays_act[is.na(df_ed_grade_act_cons_res$ndays_act)] <- 0
df_ed_grade_act_cons_res$nplay_video[is.na(df_ed_grade_act_cons_res$nplay_video)] <- 0
df_ed_grade_act_cons_res$nchapters[is.na(df_ed_grade_act_cons_res$nchapters)] <- 0
df_ed_grade_act_cons_res$nforum_posts[is.na(df_ed_grade_act_cons_res$nforum_posts)] <- 0

# Build Linear Model

fit_lm_to_preds <- function( pred_var ) 
 {
 if (length(pred_var) == 0) 
   { 
   pred_var <- c(".")
 }
  
 preds <- paste(pred_var, collapse=" + ")
 form_preds <- as.formula(paste0("grade ~ ", preds))
 fit_pred_choices <- lm(formula = form_preds, data = df_ed_grade_act_cons_res)
  fit_pred_choices
  }
