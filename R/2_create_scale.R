library(dplyr)

df <- readRDS("data/clean/0_data_fa.rds") 

df$scale_redneck <- NA
df$scale_redneck <- df$lifestyle_motorized_freq_scale +
                    df$lifestyle_hunting_freq_scale +
                    df$lifestyle_fishing_freq_scale +
                    df$lifestyle_pickup_scale +
                    df$lifestyle_guns_number_scale / 5
table(df$scale_redneck)
hist(df$scale_redneck)

saveRDS(df, "data/clean/1_data_scale.rds")
