##R tutorial Javier Rojas Carrillo 10/10/2023-11/10/2023
#1. Create a vector with numbers from 1 to 31. With this vector and the command paste() create a vector named “tree.name” with 31 tree names, from “Tree_1” to “Tree_31”.
V31 <- c(1:31)
tree.name <- paste("Tree", V31,sep = "_")
mode(tree.name)

#2. Make and object called “d0” with the data frame “trees” in R datasets. Look into the help to see what is into this data frame. ¿How many variables and observations there are in d0?
d0 <- trees
class(d0)
#    31 observations and 3 variables

#3. Add your variable tree.name to d0
d0$tree.name <- tree.name

#4. Make the code to extract the name in tree.name of the larger (volume), the highest and the widest tree.
tf <- d0$Volume == max(d0$Volume) #setting the condition
d0$tree.name[tf]
vf <- d0$Height == max(d0$Height)
d0$tree.name[vf]
wf <- d0$Girth == max(d0$Girth)
d0$tree.name[wf]
# For all is Tree_31

#5. Using the function mean() calculate the mean Diameter, Height and Volume.

mg <- mean(d0$Girth)
mg
mh <- mean(d0$Height)
mh
mv <- mean(d0$Volume)
mv
# Mean for diameter is 13.24839, for height is 76 and for volume is 30.17097



#6. Make a new factor variable into d0 with two levels: “Large” for trees with volume larger or equal the mean and “Small” with trees with volume smaller than the mean. ¿How many “Large” trees are there?
d0$size <- NA #NA is not available empty
tf <- d0$Volume >= mv
d0$size[tf] <- "Large"
d0$size[!tf] <- "Small" #! will be opposite
d0$size
d0$size == "Large"
d0$size == "Small"
sum(d0$size == "Large")
length(d0$size[d0$size == "Large"]) #both work
sum(d0$size == "Small") #double check
#There are 12 "Large" trees
  
#7. Make a new factor variable into d0 with “Tall” for trees taller or equal the mean and “Short” with trees with Height shorter than the mean.
d0$higher <- NA
vf <- d0$Height >= mh
d0$higher[vf] <- "Tall"
d0$higher[!vf] <- "Short" 
sum(d0$higher == "Tall")
sum(d0$higher == "Short")
#There are 14 "Short" trees in d0

#8. Make a subset with the trees that are both short and large and calculate the mean diameter of these Short-Large trees in meters. How many “Short_Large” trees are there?
sl <- d0$size == "Large" & d0$higher == "Short" 
sum(d0$size == "Large" & d0$higher == "Short")
#There are 2 Short-Large trees
mean(d0$Girth[sl])
#The mean diameter of Short-Large trees is 15.25
