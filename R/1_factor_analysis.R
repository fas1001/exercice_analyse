# =====================================================
# Script: 1_factor_analysis.R 
# =====================================================

library(dplyr)
library(tidyr)

# Chargement des données nettoyées et sélection des variables d'intérêt
df <- readRDS("data/clean/0_data_fa.rds") %>%
  select(ends_with("scale")) %>%    # Sélection uniquement des variables d'échelle
  drop_na()                         # Suppression des lignes avec valeurs manquantes

# Analyse factorielle avec la fonction topdown_fa du package sondr
# Cette fonction effectue une analyse factorielle exploratoire
factor_analysis <- sondr::topdown_fa(df)

# Analyse factorielle sans la variable de consommation de viande
df_no_meat <- df |>
  select(-lifestyle_eat_meat_freq_scale)
factor_analysis_no_meat <- sondr::topdown_fa(df_no_meat)

# Sauvegarde du graphique de l'analyse factorielle
ggplot2::ggsave("results/figures/redneck_scale.png", width = 16, height = 9, dpi = 300)

