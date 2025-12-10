library(here)
library(ggplot2)

original_data <- read.csv2(here("data/CleanData_S4_final.csv"))

box_plot <- ggplot(original_data, aes(x = condition_ofi, y = perceived_ofi)) +
  geom_boxplot()
  