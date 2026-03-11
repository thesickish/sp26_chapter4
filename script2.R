
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

# Example 2

?billboard
names(billboard)

billboard %>% 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "ranking",
    values_drop_na = TRUE
  )

# Example 3

table2

t2_wide <- table2 %>%
  pivot_wider(
    names_from = type,
    values_from = count
  )

# Example 4

stocks <- tibble(
  year = c(2019,2019,2019,2020,2020,2020),
  qtr = c(1,2,3,2,3,4),
  return = c(1,2,3,NA,2,3)
)

# Implicit missing values: simply not present in data
# Explicit missing values: flagged with NA

stocks %>%
  pivot_wider(
    names_from = year,
    values_from = return
  )

# Example 5

fish_enouncters

fe_wide <- fish_encounters %>%
  pivot_wider(
    names_from = station,
    values_from = seen,
    values_fill = 0
  )



