
install.packages("rJava")

#install.packages("xlsx")
install.packages("xlsx")
library("xlsx")

read.xlsx(Results.xlsx, sheetIndex=1, header=TRUE, colClasses=NA)

#install geomorph package
install.packages("geomorph")

#load geomorph
library("geomorph")

readland.tps("arcs.tps")
#load .tps file
arcs <- readland.tps("arcs.tps", specID= "ID")

#view the .tps file
View(arcs)

#check the number of dimensions in your data
dim(arcs)

#Name new function
arcsGPA <- gpagen(arcs)

#GPA results 
arcsGPA

#plot the GPA
plot(arcsGPA)

#Name new function
arcsPCA <- prcomp(arcs)

#Plot the PCA
arcsPCA <- plotTangentSpace(arcsGPA$coords, label = TRUE)

#View of summary of variance associated with each PC axis 
arcsPCA$pc.summary

#View the shape variables as principal component scores
arcsPCA$pc.scores



