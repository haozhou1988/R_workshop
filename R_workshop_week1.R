##############################################################################
##                                                                          ##
##                         Set Work Directories                             ##
##                                                                          ##
##############################################################################

mtcars
getwd()
setwd("~/Desktop/R_file")
write.csv(mtcars,file = "mtcars.csv")
hao = read.csv("mtcars.csv",sep = ",", header = TRUE)
read.csv(file = "mtcars.csv",sep = ",",header = FALSE)

File = list.files("~/Desktop/R_file")
File = list.files("~/Desktop/R_file",pattern = ".csv")
                                                                             ### Pattern option     ##
                                                                             ### Regular Expression ##


##############################################################################
##                                                                          ##
##                          Inspecting Dataset                              ##
##                                                                          ##
##############################################################################

head(mtcars)                                                                 ### default is first 6 lines of a dataset,option n =   ###
tail(mtcars)                                                                 ### default is last 6 lines of a dataset, option n =   ###
names(mtcars)                                                                ### a dataset's all column names                       ###
View(mtcars)                                                                 ### View the whole dataset                             ###
names(mtcars)[1]
###############################################################################
##                                                                           ##
##                          subseting data set                               ##
##                                                                           ##
###############################################################################
df <- data.frame(x = 1:5, y = c('a', NA, 'c','d','e'), z = c("f","g","h","i","k"))
is.na()
a = c(1,2,3,4,6,5)
is.na(a)
$   
df$x                                                                         # Use the $ operator to address a column by name #
%in%                                                                         ### http://dr-k-lo.blogspot.com/2013/11/in-in-r-underused-in-operator.html ###
1:5 %in% 4:10
which()
which(is.na(a))
df[1,]                                                                       ## select a row ##
df[1:3,]                                                                     ## select several row    ##
df[c(1,3),]
df[,1]                                                                       ## select a column       ##
df[,1:2]                                                                     ## select several column ##
df[1,3]                                                                      ## select a element      ##
df[c(1:3),1]
df[c(1:3),c(1:2)]
##drop a row or column##
df[-1,]
df[,-1]
## select variable and observations ##
df[which(df$x>2),][,c(1,3)]
subset(df,df$x>2,select=c(1,3))
### drop vraible by observation name or column name ###
dat <- data.frame(x=1:5, y=2:6, z=3:7, u=4:8)
dat[ , !names(dat) %in% c("z","u")] 
dat[ , -which(names(dat) %in% c("z","u"))]                                  ## works as expected
dat[ , -which(names(dat) %in% c("foo","bar"))]                              ## deletes all columns! Probably not what you wanted...
which(names(dat) %in% c("foo","bar"))
dat[ , !names(dat) %in% c("foo","bar")]                      
                                                                            ## integer creates a integer vector of the specified length. 
                                                                            ## Each element of the vector is equal to 0.


