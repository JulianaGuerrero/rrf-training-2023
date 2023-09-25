df = read.csv('Secondary/R/data/colombia_connectivity_cleaned.csv')

library(here)
install.packages('here')
library(here)
library(tidyverse)
df = read.csv(here("Secondary","R","data","colombia_connectivity_cleaned.csv"))

df = df %>% mutate(new_var = 'x')

write.csv(df,
          here("Secondary","R","outputs","new_df.csv"),
          row.names=F)


write.csv(df,
          here("Secondary/R/outputs","new_dfv2.csv"),
          row.names=F)

install.packages("renv")
library(renv)
renv::init() #set up an isolated environment
