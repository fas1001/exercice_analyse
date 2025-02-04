library(dplyr)

df <- readRDS("data/clean/1_data_scale.rds")

m1 <- lm(ses_education ~ scale_redneck, data = df)
m2 <- lm(ses_education ~ scale_redneck + ses_income, data = df)
m3 <- lm(ses_education ~ scale_redneck + ses_religiosity, data = df)
m4 <- lm(ses_education ~ scale_redneck + ses_income + ses_religiosity, data = df)

summary(m1)
summary(m2)
summary(m3)
summary(m4)

# Combine models into a list
models <- list(m1, m2, m3, m4)

# Customize GOF to include only R-squared and observations
custom_gof <- list(
  list(raw = "r.squared", clean = "R²", fmt = 3),
  list(raw = "nobs", clean = "Observations", fmt = 0)
)

# Generate the LaTeX table
modelsummary::modelsummary(
  models,
  output = "results/tables/reg_table.md",
  stars = TRUE,
  gof_map = custom_gof,
  title = "Regression Results",
  notes = list("*** p < 0.01, ** p < 0.05, * p < 0.1. Standard errors in parentheses.")
)
