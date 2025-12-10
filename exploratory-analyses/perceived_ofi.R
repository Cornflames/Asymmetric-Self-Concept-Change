library(here)
library(ggplot2)
library(dplyr)

original_data <- read.csv2(here("data/CleanData_S4_final.csv"))

box_plot <- ggplot(original_data, aes(x = condition_ofi, y = perceived_ofi)) +
  geom_boxplot()


# Re-analysis with perceived_ofi
raw_data <- original_data

raw_data <- raw_data %>% mutate(
  dod = recode_factor(dod, `negative` = "negative", `neither positive nor negative` = "neither positive nor negative", `positive` = "positive", `-9`= NA_character_)
)

raw_data <- cbind(raw_data, "attention_sc_task" = ifelse(raw_data$attention_sc == "right" & raw_data$attention_task == "right", "right", "wrong"))

#Apply exclusion criteria
data <- raw_data %>% filter(attention_sc_task == "right" & attention_coping == 9 & use_me == "yes")

#Data set without participants with a neither positive nor negative direction of discrepancy
data2 <- data %>% filter(dod != "neither positive nor negative")

#Exclusions due to single criteria and per condition
data3 <- raw_data %>% filter(attention_sc_task == "right")
data4 <- data3 %>% filter(attention_coping == 9)
data5 <- data4 %>% filter(use_me == "yes")

raw_data %>% group_by(condition_ofi) %>% count(attention_sc_task)
data3 %>% group_by(condition_ofi) %>% count(attention_coping)
data4 %>% group_by(condition_ofi) %>% count(use_me)

data2 <- data2 %>% dplyr::mutate(
  centered_sod = scale(sod, scale = TRUE) %>% as.vector
)

lm_sc_diff_absolute <- lm(sc_diff_absolute ~ centered_sod*dod_num*perceived_ofi, data2)
summary(lm_sc_diff_absolute)