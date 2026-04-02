# install.packages("tidyverse")
library(tidyverse)

x <- tibble(
  key = c(0:4),
  val_x = c("x0","x1","x2","x3","x4")
)

y <- tibble(
  key = c(1:5),
  val_y = c("y1","y2","y3","y4","y5")
)

inner_join(x,y)
left_join(x,y)
right_join(x,y)
full_join(x,y)

# Change name of joining column
names(x)[1] = "ID"
names(y)[1] = "ID"

# Conditionals

x <- 0

if (x < 0) { 
  print("x is negative")
}

if (x < 0) { 
  print("x is negative")
} else {
  print("x is positive")
}

if (x < 0) { 
  print("x is negative")
} else if (x == 0) {
  print("x is zero")
  } else {
  print("x is positive")
}

# Functions

simple.function <- function(x,z){
  print(x+1)
}

less.simple.function <- function(x,z){
  print(x-z+1)
}

less.simple.function(2,10)
less.simple.function(x = 2, z = 10)
less.simple.function(z = 10, x = 2)
less.simple.function(10,2)

# Explicit returns
# Note: implicit returns are just the last object created

explicit.return <- function(x){
  r = x + 1
  return(r)
  r+2
}

dumbfun <- function(x) {
  return(x)
  print("this will never print :(")
}

dumbfun2 <- function(x) {
  print("will this print?")
  return(x)
}

dumbfun3 <- function(x,y){
  thing1 <- x
  thing2 <- y
  l = list(thing1,thing2)
  names(l) <- c("results","error")
  return(l)
}

a = 1
b = 2

f = function(x){
  a = 3
  b = 4
  a*x + b
}

# Loops

fruit <- c("apples","oranges","pears","bananas")

# while loop - keeps going while condition is met

i = 1
while(i <= length(fruit))
{
  print(fruit[i])
  i = i+1
}

# for loop - does something a certain number of times

for(j in 1:length(fruit)){
  print(fruit[j])
}





