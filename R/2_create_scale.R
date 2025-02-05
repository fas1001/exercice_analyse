# =====================================================
# Script: 2_create_scale.R
# =====================================================

library(dplyr)

# Chargement des données
df <- readRDS("data/clean/0_data_fa.rds") 

# Création de l'échelle composite 'redneck'
# Moyenne de 5 variables identifiées par l'analyse factorielle
df$scale_redneck <- NA
df$scale_redneck <- (df$lifestyle_motorized_freq_scale +
                     df$lifestyle_hunting_freq_scale +
                     df$lifestyle_fishing_freq_scale +
                     df$lifestyle_pickup_scale +
                     df$lifestyle_guns_number_scale) / 5

# Vérification de la distribution
table(df$scale_redneck)    # Distribution des valeurs
hist(df$scale_redneck)     # Histogramme

# Sauvegarde des données avec la nouvelle échelle
saveRDS(df, "data/clean/1_data_scale.rds")
