library(dplyr)
library(tidyr)

df <- readRDS("data/raw/data_raw.rds")

df_clean <- df

# Variable de fréquence de pêche
table(df$lifestyle_fishing_freq)
df_clean$lifestyle_fishing_freq_scale<- NA
df_clean$lifestyle_fishing_freq_scale[df$lifestyle_fishing_freq == "Never"] <- 0    
df_clean$lifestyle_fishing_freq_scale[df$lifestyle_fishing_freq == "Almost never"] <- 0.25
df_clean$lifestyle_fishing_freq_scale[df$lifestyle_fishing_freq == "Sometimes"] <- 0.5
df_clean$lifestyle_fishing_freq_scale[df$lifestyle_fishing_freq == "Often"] <- 0.75
df_clean$lifestyle_fishing_freq_scale[df$lifestyle_fishing_freq == " Very often"] <- 1
table(df_clean$lifestyle_fishing_freq_scale, useNA = "ifany")

# Variable de fréquence de chasse
table(df$lifestyle_hunting_freq)
df_clean$lifestyle_hunting_freq_scale<- NA
df_clean$lifestyle_hunting_freq_scale[df$lifestyle_hunting_freq == "Never"] <- 0
df_clean$lifestyle_hunting_freq_scale[df$lifestyle_hunting_freq == "Almost never"] <- 0.25
df_clean$lifestyle_hunting_freq_scale[df$lifestyle_hunting_freq == "Sometimes"] <- 0.5
df_clean$lifestyle_hunting_freq_scale[df$lifestyle_hunting_freq == "Often"] <- 0.75
df_clean$lifestyle_hunting_freq_scale[df$lifestyle_hunting_freq == "Very often"] <- 1
table(df_clean$lifestyle_hunting_freq_scale)

# Variable de fréquence de loisirs motorisés
table(df$lifestyle_motorized_freq)
df_clean$lifestyle_motorized_freq_scale <- NA
df_clean$lifestyle_motorized_freq_scale[df$lifestyle_motorized_freq == "Never"] <- 0
df_clean$lifestyle_motorized_freq_scale[df$lifestyle_motorized_freq == "Almost never"] <- 0.25
df_clean$lifestyle_motorized_freq_scale[df$lifestyle_motorized_freq == "Sometimes"] <- 0.5
df_clean$lifestyle_motorized_freq_scale[df$lifestyle_motorized_freq == "Often"] <- 0.75
df_clean$lifestyle_motorized_freq_scale[df$lifestyle_motorized_freq == "Very often"] <- 1
table(df_clean$lifestyle_motorized_freq_scale)

# Variable de fréquence de consommation de viande
table(df$lifestyle_eat_meat_freq)
df_clean$lifestyle_eat_meat_freq_scale <- NA
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "Never"] <- 0 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "A few times per year"] <- 1 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "Once a month"] <- 2 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "Once a week"] <- 3 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "A few times a week"] <- 4 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "Once a day"] <- 5 / 6
df_clean$lifestyle_eat_meat_freq_scale[df$lifestyle_eat_meat_freq == "More than once a day"] <- 6 / 6
table(df_clean$lifestyle_eat_meat_freq_scale)

# Variable du nombre d'armes à feu
table(df$lifestyle_guns_number)
df_clean$lifestyle_guns_number_scale[df$lifestyle_guns_number == "None"] <- 0 / 3
df_clean$lifestyle_guns_number_scale[df$lifestyle_guns_number == "1"] <- 1 / 3
df_clean$lifestyle_guns_number_scale[df$lifestyle_guns_number == "2-4"] <- 2 / 3
df_clean$lifestyle_guns_number_scale[df$lifestyle_guns_number == "5+"] <- 3 / 3
table(df_clean$lifestyle_guns_number_scale)

# Variable de pickup
table(df$lifestyle_prius) 
df_clean$lifestyle_pickup_scale <- NA
df_clean$lifestyle_pickup_scale[df$lifestyle_prius == "Pickup truck"] <- 1
df_clean$lifestyle_pickup_scale[df$lifestyle_prius != "Pickup truck"] <- 0
table(df_clean$lifestyle_pickup_scale)

# Variable de revenu
table(df$ses_income)
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

# Variable de la religiosité
table(df$ses_religiosity_importance)
df_clean$ses_religiosity <- NA
df_clean$ses_religiosity <- as.numeric(df$ses_religiosity_importance) / 100
table(df_clean$ses_religiosity)

# Variable de niveau d'éducation
table(df$ses_education)
df_clean$ses_education <- NA
df_clean$ses_education[df$ses_education == "Elementary school"] <- 0 / 6
df_clean$ses_education[df$ses_education == "Did not complete high school"] <- 1 / 6
df_clean$ses_education[df$ses_education == "High school graduate"] <- 2 / 6
df_clean$ses_education[df$ses_education == "Associate degree"] <- 3 / 6
df_clean$ses_education[df$ses_education == "Some college"] <- 4 / 6
df_clean$ses_education[df$ses_education == "College graduate"] <- 5 / 6
df_clean$ses_education[df$ses_education == "Postgraduate degree"] <- 6 / 6
table(df_clean$ses_education)

saveRDS(df_clean, "data/clean/0_data_fa.rds")


