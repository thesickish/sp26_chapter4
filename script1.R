
# Working with factors
p <- c("Democrat","Democrat","Republican","Republican")
p2 <- factor(p)

levels(p)
levels(p2)

factor(p2,levels = c("Democrat","Republican","Independent"))
factor(p2,levels = c("democrat","republican"))

# Multidimensional data

bad = cbind(c1 = c(10,5), c2 = c("a","b"))
bad
class(bad)

good = data.frame(c1 = c(10,5), c2 = c("a","b"))
good
class(good)

# Operating on data.frames

# subsetting [row,col]
good[1,1]
good[1,]
good[,1]

good[order(good$c1)] # not what we want if sorting data
good[order(good$c1),]

# indexing from the right
good[[-1]] # same as good[[2]]
good[[-2]] # same as good[[1]]

# subassignment
good$c1[good$c1 < 10] <- 0
good$c2[good$c1 < 10] <- "c"

