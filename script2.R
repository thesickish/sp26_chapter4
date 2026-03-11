
# Install package
# install.packages("tidyverse")

# Load package
library(tidyverse)

table4a

t4a_long <- table4a %>%
  pivot_longer(
    cols = c("1999","2000"),
    names_to = "year",
    values_to = "tb_cases"
  )

# t4a_long$year <- as.numeric(t4a_long$year)
t4a_long$year <- t4a_long$year %>% as.numeric()


