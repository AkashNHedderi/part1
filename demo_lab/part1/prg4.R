df = airquality
dim(df)

sapply(df,class)

print("The Missing values are as follows")
xcolNames <- colnames(df)
x<- colSums(is.na(df))
print(x)

which(is.na(df))
sum(is.na(df))


for(i in 1:ncol(df))
  df1[,i]<- ifelse ( is.na(df[,i]), mean(df[,i], na.rm = TRUE), df[,i])

print(df1)
colSums(is.na(df1))

df2<-na.omit(df)
colSums(is.na(df2))

