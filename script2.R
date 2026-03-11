
install.packages("pacman")

# Load a bunch of packages
pacman::p_load(
  tidyverse, # the tidyverse framework
  skimr, # skimming data 
  here, # computational reproducibility
  infer, # statistical inference 
  tidymodels, # statistical modeling 
  gapminder, # toy data
  nycflights13, # for exercise
  ggthemes, # additional themes
  ggrepel, # arranging ggplots
  patchwork, # arranging ggplots
  broom, # tidying model outputs
  waldo # side-by-side code comparison
)

t4a_long <- table4a %>%
  pivot_longer(
    cols = c("1999","2000"),
    names_to = "year",
    values_to = "tb_cases"
  )




