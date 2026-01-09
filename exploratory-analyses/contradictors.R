original_data <- read.csv2("data/CleanData_S4_final.csv")

library(dplyr)

# Applying exclusion criteria
data_after_exclusion <- original_data %>% filter(attention_coping == 9)
data_after_exclusion <- data_after_exclusion %>%
  filter(attention_sc == "right" & attention_task == "right")
data_after_exclusion <- data_after_exclusion %>% filter(use_me == "yes")

data <- data_after_exclusion %>% select(
  subject_nr,
  condition_ofi,
  starts_with("sc_t1_0"),
  starts_with("sc_t2_0"),
  task_emotion_score_percent
)

data <- data %>% mutate(
  sc_t1 = rowMeans(across(c(sc_t1_01, sc_t1_02, sc_t1_03, sc_t1_04))),
  sc_t2 = rowMeans(across(c(sc_t2_01, sc_t2_02, sc_t2_03, sc_t2_04))),
  .before = task_emotion_score_percent # höhere Übersichtlichkeit
)

# No longer the absolute value of the difference, but the raw value of the difference
data <- data %>% mutate(sc_diff = sc_t2 - sc_t1)

# New variable that codes for the direction of self-concept change
data <- data %>% mutate(dsc = case_when(
  sc_diff > 0 ~ "positive",
  sc_diff < 0 ~ "negative",
  sc_diff == 0 ~ "neither positive nor negative"
))

# absolute discrepancy
data <- data %>% mutate(
  discrepancy = task_emotion_score_percent - ((sc_t1 - 1)/8)*100
)

# direction of discrepancy
data <- data %>% mutate(dod = case_when(
  discrepancy > 0 ~ "positive",
  discrepancy < 0 ~ "negative",
  discrepancy == 0 ~ "neither positive nor negative"
))

# Exclusion where no discrepancy
data <- data %>% filter(dod != "neither positive nor negative")
n_final_sample <- nrow(data)
n_final_sample

# Exclusion where no self-concept change
data <- data %>% filter(dsc != "neither positive nor negative")

# ********************************
# * Are there any contradictors? *
# ********************************
contradictors <- data %>% filter(dsc != dod)
nrow(contradictors)

round((nrow(contradictors) / n_final_sample) * 100, digits = 1)
