# Install package
# install.packages("tidyverse")

# Load package
library(tidyverse)

mtcars

# Sorting (ugly way)

arrange(mtcars,mpg)

# Nicer way
mtcars %>% arrange(mpg)

# Even nicer way

mtcars %>% arrange(mpg) %>% head()

# Sorting backwards (decreasing)

mtcars %>% arrange(desc(mpg)) %>% head()

# Sorting on multiple variables

mtcars %>% arrange(desc(cyl),desc(mpg)) %>% head()

# Subsetting rows

starwars %>% head()

table(starwars$gender)

table(starwars$gender) %>% class()

starwars %>% filter(gender == "feminine")

starwars %>% filter(gender == "feminine") %>%
  arrange(desc(height))

starwars %>% nrow()

starwars %>% filter(height < 180, height > 160) %>% nrow()

starwars %>% filter(height < 180 & height > 160) %>% nrow()

starwars %>% filter(height < 180 | height > 160) %>% nrow()

is.na(starwars$height)

starwars %>% filter(is.na(height))

starwars %>% filter(!is.na(height))

# basic string matching

ars <- starwars %>% filter(grepl("ars",tolower(name)))

starwars %>% filter(str_detect(tolower(name),"ars"))

starwars %>% filter(str_detect(tolower(name),"ars")) %>%
  slice(2:3)

# working with categorical data
table(starwars$hair_color)


starwars %>% filter(hair_color %in% c("black","brown")) %>%
  filter(eye_color %in% c("black","brown"))

# random sampling

starwars %>% slice_sample(
  prop = .10,
  replace = FALSE # TRUE means can pull same obs twice
)

starwars %>% slice_sample(
  n = 20,
  replace = FALSE
)

set.seed(1234)

starwars %>% slice_sample(
  n = 20,
  replace = FALSE
)

