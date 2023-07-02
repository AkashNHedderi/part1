data()
head(mtcars)


rownum <- nrow(mtcars)
colnum <- ncol(mtcars)

x<- data.frame(mtcars)
automatic <-0
manual <-0

for(i in 1:nrow(x))
{
  ifelse(x[i,9]==1,automatic<-automatic+1,manual<-manual+1)
}

ifelse(automatic>manual,print("There are more automatic"),print("There are more manual"))


HorsePower <- x[,4]
Weight <- x[,6]
scatter.smooth(HorsePower,Weight, span=2/3, degree = 1, family =c("symmetric","gaussian"))

Mpg <- x[,1]
hist(Mpg, breaks = 12, col ="lightblue", border = "pink")

a1 <- as.integer(x[,2])
a2 <- as.integer(x[,8])
a3 <- as.integer(x[,9])

newmtc = data.frame(a1,a2,a3)
print(newmtc)

subset(mtcars,cyl<5)

