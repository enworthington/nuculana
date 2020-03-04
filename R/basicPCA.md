# Basic PCA Analysis for Morphometric Data

````r
## Load geomorph package

library(geomorph)

## Load data

arcs <- readland.tps("arcs.tps", specID = "ID")

## Conduct GPA

arcsGPA <- gpagen(arcs)

arcsGPA

plot(arcsGPA)

## Conduct PCA

arcPCA <- plotTangentSpace(arcsGPA$coords)

arcsPCA$pc.summary

## Color code by species

specimenlist <- read.csv("specimenlist.csv", header = TRUE)

plotTangentSpace(arcsGPA$coords, 
                 groups = specimenlist$Species,
                 legend = TRUE)
````
