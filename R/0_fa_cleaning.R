# =====================================================
# Script: 0_fa_cleaning.R 
# =====================================================

# Chargement des packages nécessaires
library(dplyr)    # Pour la manipulation des données
library(tidyr)    # Pour le nettoyage des données et la gestion des valeurs manquantes

# Chargement des données brutes à partir du fichier RDS
# RDS est un format de fichier propre à R qui permet de sauvegarder des objets R
df <- readRDS("data/raw/data_raw.rds")

# Création d'une copie des données pour le nettoyage
# C'est une bonne pratique de garder les données originales intactes
df_clean <- df

# ==============================================================================
# SECTION 1: Variables liées au style de vie
# ==============================================================================

# -----------------------------
# 1.1 Fréquence de pêche
# -----------------------------
# Affichage de la distribution originale pour vérification
table(df$lifestyle_fishing_freq)

# Création d'une nouvelle variable standardisée sur une échelle de 0 à 1
# Cette standardisation permet de comparer plus facilement les variables entre elles
df_clean$lifestyle_fishing_freq_scale <- NA  # Initialisation avec NA
df_clean$lifestyle_fishing_freq_scale[df$lifestyle_fishing_freq == "Never"] <- 0    
df_clean$lifestyle_fishing_freq_scale[df$lifestyle_fishing_freq == "Almost never"] <- 0.25
df_clean$lifestyle_fishing_freq_scale[df$lifestyle_fishing_freq == "Sometimes"] <- 0.5
df_clean$lifestyle_fishing_freq_scale[df$lifestyle_fishing_freq == "Often"] <- 0.75
df_clean$lifestyle_fishing_freq_scale[df$lifestyle_fishing_freq == " Very often"] <- 1

# Vérification de la nouvelle distribution, incluant les NA
table(df_clean$lifestyle_fishing_freq_scale, useNA = "ifany")

# -----------------------------
# 1.2 Fréquence de chasse
# -----------------------------
# Même procédure que pour la pêche
table(df$lifestyle_hunting_freq)  # Distribution originale

# Standardisation sur échelle 0-1
df_clean$lifestyle_hunting_freq_scale <- NA
df_clean$lifestyle_hunting_freq_scale[df$lifestyle_hunting_freq == "Never"] <- 0
df_clean$lifestyle_hunting_freq_scale[df$lifestyle_hunting_freq == "Almost never"] <- 0.25
df_clean$lifestyle_hunting_freq_scale[df$lifestyle_hunting_freq == "Sometimes"] <- 0.5
df_clean$lifestyle_hunting_freq_scale[df$lifestyle_hunting_freq == "Often"] <- 0.75
df_clean$lifestyle_hunting_freq_scale[df$lifestyle_hunting_freq == "Very often"] <- 1

table(df_clean$lifestyle_hunting_freq_scale)

# -----------------------------
# 1.3 Fréquence des loisirs motorisés
# -----------------------------
table(df$lifestyle_motorized_freq)

df_clean$lifestyle_motorized_freq_scale <- NA
df_clean$lifestyle_motorized_freq_scale[df$lifestyle_motorized_freq == "Never"] <- 0
df_clean$lifestyle_motorized_freq_scale[df$lifestyle_motorized_freq == "Almost never"] <- 0.25
df_clean$lifestyle_motorized_freq_scale[df$lifestyle_motorized_freq == "Sometimes"] <- 0.5
df_clean$lifestyle_motorized_freq_scale[df$lifestyle_motorized_freq == "Often"] <- 0.75
df_clean$lifestyle_motorized_freq_scale[df$lifestyle_motorized_freq == "Very often"] <- 1

table(df_clean$lifestyle_motorized_freq_scale)

# -----------------------------
# 1.4 Fréquence de consommation de viande
# -----------------------------
# Note: Ici nous utilisons une échelle différente (divisions par 6)
# car il y a plus de catégories dans la variable originale
table(df$lifestyle_eat_meat_freq)

df_clean$lifestyle_eat_meat_freq_scale <- NA
# Conversion en échelle 0-1 avec 7 niveaux (0/6 à 6/6)
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "Never"] <- 0 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "A few times per year"] <- 1 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "Once a month"] <- 2 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "Once a week"] <- 3 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "A few times a week"] <- 4 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "Once a day"] <- 5 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "More than once a day"] <- 6 / 6

table(df_clean$lifestyle_eat_meat_freq_scale)

# -----------------------------
# 1.5 Nombre d'armes à feu
# -----------------------------
table(df$lifestyle_guns_number)

# Échelle 0-1 avec 4 niveaux (0/3 à 3/3)
df_clean$lifestyle_guns_number_scale[df$lifestyle_guns_number == "None"] <- 0 / 3
df_clean$lifestyle_guns_number_scale[df$lifestyle_guns_number == "1"] <- 1 / 3
df_clean$lifestyle_guns_number_scale[df$lifestyle_guns_number == "2-4"] <- 2 / 3
df_clean$lifestyle_guns_number_scale[df$lifestyle_guns_number == "5+"] <- 3 / 3

table(df_clean$lifestyle_guns_number_scale)

# -----------------------------
# 1.6 Possession d'un pickup
# -----------------------------
# Variable binaire (0/1)
table(df$lifestyle_prius) 

df_clean$lifestyle_pickup_scale <- NA
df_clean$lifestyle_pickup_scale[df$lifestyle_prius == "Pickup truck"] <- 1
df_clean$lifestyle_pickup_scale[df$lifestyle_prius != "Pickup truck"] <- 0

table(df_clean$lifestyle_pickup_scale)

# ==============================================================================
# SECTION 2: Variables socioéconomiques
# ==============================================================================

# -----------------------------
# 2.1 Revenu
# -----------------------------
table(df$ses_income)

# Conversion des tranches de revenu en échelle 0-1
df_clean$ses_income <- NA
df_clean$ses_income[df$ses_income == "$0-9,999"] <- 0 / 9
df_clean$ses_income[df$ses_income == "$10,000-14,999"] <- 1 / 9
df_clean$ses_income[df$ses_income == "$15,000-24,999"] <- 2 / 9
df_clean$ses_income[df$ses_income == "$25,000-34,999"] <- 3 / 9
df_clean$ses_income[df$ses_income == "$35,000-49,999"] <- 4 / 9
df_clean$ses_income[df$ses_income == "$50,000-74,999"] <- 5 / 9
df_clean$ses_income[df$ses_income == "$75,000-99,999"] <- 6 / 9
df_clean$ses_income[df$ses_income == "$100,000-149,999"] <- 7 / 9
df_clean$ses_income[df$ses_income == "$150,000-199,999"] <- 8 / 9
df_clean$ses_income[df$ses_income == "$200,000+"] <- 9 / 9

table(df_clean$ses_income)

# -----------------------------
# 2.2 Religiosité
# -----------------------------
# La variable originale est déjà sur une échelle de 0-100
table(df$ses_religiosity_importance)

# Conversion en échelle 0-1 en divisant par 100
df_clean$ses_religiosity <- NA
df_clean$ses_religiosity <- as.numeric(df$ses_religiosity_importance) / 100

table(df_clean$ses_religiosity)

# -----------------------------
# 2.3 Niveau d'éducation
# -----------------------------
table(df$ses_education)

# Conversion en échelle 0-1 avec 7 niveaux
df_clean$ses_education <- NA
df_clean$ses_education[df$ses_education == "Elementary school"] <- 0 / 6
df_clean$ses_education[df$ses_education == "Did not complete high school"] <- 1 / 6
df_clean$ses_education[df$ses_education == "High school graduate"] <- 2 / 6
df_clean$ses_education[df$ses_education == "Associate degree"] <- 3 / 6
df_clean$ses_education[df$ses_education == "Some college"] <- 4 / 6
df_clean$ses_education[df$ses_education == "College graduate"] <- 5 / 6
df_clean$ses_education[df$ses_education == "Postgraduate degree"] <- 6 / 6

table(df_clean$ses_education)

# ==============================================================================
# Sauvegarde des données nettoyées
# ==============================================================================
# Sauvegarde du dataframe nettoyé dans un nouveau fichier RDS
saveRDS(df_clean, "data/clean/0_data_fa.rds")
