library(dplyr)
library(tidyr)

df <- readRDS("data/clean/0_data_fa.rds") %>%
  select(ends_with("scale")) %>%
  drop_na()

factor_analysis <- sondr::topdown_fa(df)

df_no_meat <- df |>
  select(-lifestyle_eat_meat_freq_scale)

factor_analysis_no_meat <- sondr::topdown_fa(df_no_meat)

ggplot2::ggsave("results/figures/redneck_scale.png", width = 16, height = 9, dpi = 300)
