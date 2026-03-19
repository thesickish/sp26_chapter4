# install.package("tidyverse")
# install.package("gapminder")
# install.packages("tidymodels)

library(tidyverse)
library(gapminder)
library(tidymodels)

msleep # sleep data about mammals

names(msleep) # Base R
msleep %>% names() # only in tidyverse

# Subsetting columns
msleep %>% select(order) %>% class()
msleep %>% select(order,name)
msleep %>% select(1:4)

msleep %>% select(contains("sleep"))
msleep %>% select(dplyr::contains("sleep"))

msleep %>% select(starts_with("b"))
msleep %>% select(ends_with("wt"))

# Working with gapminder data

table(gapminder$continent) # base R
table(gapminder$continent) %>% arrange(desc(n)) # doesn't work

gapminder %>% count(continent) # tidyverse (better)
gapminder %>% count(continent) %>% arrange(desc(n)) # works


gapminder %>% add_count(continent)

gapminder %>% group_by(continent,year) 

gapminder %>% group_by(continent,year) %>% add_count
gapminder %>% group_by(continent,year) %>% add_tally # same thing
gapminder %>% group_by(continent,year) %>% mutate(n=n()) # same thing

gapminder %>%
  group_by(continent) %>%
  add_tally(year) # different - what is it doing?

# print dataframe with country-year specific statistics
# count, mean, and standard deviations

gapminder %>% group_by(continent,year) %>%
  summarize(
    n = n(),
    mean_gdp = mean(gdpPercap),
    sd_gdp = sd(gdpPercap)
  )

# some other  functions: median(x), first(x), last(x), min(x), max(x)

nested <- gapminder %>% group_by(country,continent) %>%
  nest()

nested$data[1] # single bracket does not actually reference inside the list
nested$data[1][1,1] # doesn't work

nested$data %>% pluck(1)
nested$data[[1]]
nested$data[[1]][1,1] # works

# runnning a regression on the full gapminder dataset

gapminder %>% lm(lifeExp ~ year) # doesn't work
lm(lifeExp ~ year, data = gapminder) # works

# create a new dataframe with a new column that includes
# regression results for each country-specific dataframe

nested_model <- nested %>% mutate(models = map(data,lm_model))
nested_model$data %>% pluck(1)

# create a new dataframe with a new column that includes
# TIDIED regression results for each country-specific dataframe

tidied <- nested_model %>% mutate(tidied = map(models,tidy))
tidied$tidied %>% pluck(1)

