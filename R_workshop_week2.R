##################################################################################
#                                                                                #
#                            Rename a column                                     #                             
##################################################################################

setwd("~/Desktop/R_file")
mtcars = read.csv(file = "mtcars.csv", sep = "," , header = TRUE)
names(mtcars)[names(mtcars) == "X"] <- "ID"
names(mtcars)[which(names(mtcars) == "ID")] <-"X"
names(mtcars)[1] <- "ID"
names(mtcars)[1:3] <- c("ID_1","ID_2","ID_3")
names(mtcars)[which(names(mtcars)%in%c("ID_1","ID_2","ID_3"))] <- c("ID","mpg","cyl")

##################################################################################
#                                                                                #
#                            Sort a dataset                                      #                             
##################################################################################

sort(mtcars$mpg,decreasing = TRUE)
mtcars[order(mtcars$mpg),]
mtcars[order(-mtcars$mpg),]
mtcars[order(mtcars$mpg,mtcars$cyl),]

##################################################################################
#                                                                                #
#                            Create a new column                                 #                             
##################################################################################

mtcars$new <- (mtcars$mpg/mtcars$cyl)
mtcars <- transform(mtcars,new_1 = mpg/cyl)
aggdata <-aggregate(mtcars, by=list(cyl,vs),FUN = mean, na.rm=TRUE)

##################################################################################
#                                                                                #
#                             Basic Statistics                                   #
##################################################################################

mean(mtcars$mpg)
sd(mtcars$mpg)
var(mtcars$mpg)
median(mtcars$mpg)

##################################################################################
#                                                                                #
#                              Reshape                                           #
##################################################################################
### tidy data ###
### 1. Each variable forms a column
### 2. Each observation forms a row
### 3. Each type of observational unit forms a table

### messy data ###
### Column headers are values, not variable names.
### Multiple variables are stored in one column.
### Variables are stored in both rows and columns.
### Multiple types of observational units are stored in the same table.
### A single observational unit is stored in multiple tables.

install.packages("reshape2")
library(reshape2)
smiths
smiths_melt = melt(smiths, id = c("subject","time"), measured = c("age","weight","height"))
~   ### On the left side of the ~ operator you specify all variables that you want as columns 
    ### and on the right side of ~ you specify all variables that you want as rows. 

smiths_cast = cast(smiths_melt, subject + time ~ variable)
... ### This operator instructs R to use all variables that have not been used in the formula.
    ### variable means names(smiths)
.   ### which signifies no variables

haha = read.csv(file = "tb.csv",sep = ",",header = TRUE)

# Try to read this example__________________________________________________

library(reshape2)
library(plyr)
library(stringr)

# Load -----------------------------------------------------------------------
raw <- read.csv("tb.csv", na.strings = "")
raw$new_sp <- NULL
raw <- subset(raw, year == 2000)
names(raw)[1] <- "country"

names(raw) <- str_replace(names(raw), "new_sp_", "")
raw$m04 <- NULL
raw$m514 <- NULL
raw$f04 <- NULL
raw$f514 <- NULL


# Melt -----------------------------------------------------------------------

clean <- melt(raw, id = c("country", "year"), na.rm = TRUE)
names(clean)[3] <- "column"
names(clean)[4] <- "cases"

clean <- arrange(clean, country, column, year)

# Break up variable in to sex and age ----------------------------------------

clean$sex <- str_sub(clean$column, 1, 1)

ages <- c("04" = "0-4", "514" = "5-14", "014" = "0-14", "1524" = "15-24", "2534" = "25-34", "3544" = "35-44", "4554" = "45-54", "5564" = "55-64", "65"= "65+", "u" = NA)

clean$age <- factor(ages[str_sub(clean$column, 2)], levels = ages)

clean <- clean[c("country", "year", "sex", "age", "cases")]

