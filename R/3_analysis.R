# =====================================================
# Script: 3_analysis.R
# =====================================================

library(dplyr)

# Chargement des données avec l'échelle composite
df <- readRDS("data/clean/1_data_scale.rds")

# Création de plusieurs modèles de régression
# M1: Modèle simple avec uniquement l'échelle redneck
m1 <- lm(scale_redneck ~ ses_education, data = df)

# M2: Ajout du revenu comme variable de contrôle
m2 <- lm(scale_redneck ~ ses_education + ses_income, data = df)

# M3: Ajout de la religiosité comme variable de contrôle
m3 <- lm(scale_redneck ~ ses_education + ses_religiosity, data = df)

# M4: Modèle complet avec toutes les variables
m4 <- lm(scale_redneck ~ ses_education + ses_income + ses_religiosity, data = df)

# Résumé des résultats de chaque modèle
summary(m1)
summary(m2)
summary(m3)
summary(m4)

# Création d'un tableau de résultats en format markdown
models <- list(m1, m2, m3, m4)

# Configuration personnalisée pour le tableau de résultats
custom_gof <- list(
  list(raw = "r.squared", clean = "R²", fmt = 3),
  list(raw = "nobs", clean = "Observations", fmt = 0)
)

# Génération du tableau avec modelsummary
modelsummary::modelsummary(
  models,
  output = "results/tables/reg_table.md",
  stars = TRUE,                    # Affichage des étoiles de significativité
  gof_map = custom_gof,           # Métriques d'ajustement personnalisées
  title = "Regression de l'échelle redneck",  # Titre du tableau
)

