# Basic PCA Analysis for Morphometric Data

For an example of this process, refer to the facial analysis lab I created for my Advanced Paleobiology course, here:

[https://github.com/robyndahl/AdvancedPaleobiology/edit/master/Lectures/faces.md](https://github.com/robyndahl/AdvancedPaleobiology/edit/master/Lectures/faces.md)

````r
## Load geomorph package

library(geomorph)

## Load data

arcs <- readland.tps("arcs.tps", specID = "ID")

## Conduct GPA

arcsGPA <- gpagen(arcs)

arcsGPA

plot(arcsGPA)

````
With the basic GPA conducted, we can view a summary of the analysis:

````r
> arcsGPA

Call:
gpagen(A = arcs) 



Generalized Procrustes Analysis
with Partial Procrustes Superimposition

5 fixed landmarks
0 semilandmarks (sliders)
2-dimensional landmarks
6 GPA iterations to converge


Consensus (mean) Configuration

            X            Y
1 -0.25230179  0.075268550
2 -0.38423223  0.001651876
3 -0.19787076 -0.029351383
4 -0.02488401 -0.061857657
5  0.85928879  0.014288614

````
Next, we want to conduct the principle components analysis (PCA) using the `plotTangentSpace` function in `geomorph`

````r
## Conduct PCA

arcPCA <- plotTangentSpace(arcsGPA$coords)
````

After the PCA has been conducted, we can view a summary of the principle components:

````r
arcsPCA$pc.summary
Importance of first k=6 (out of 10) components:
                          PC1     PC2     PC3     PC4     PC5     PC6
Standard deviation     0.5511 0.10623 0.04663 0.03387 0.01988 0.01375
Proportion of Variance 0.9524 0.03539 0.00682 0.00360 0.00124 0.00059
Cumulative Proportion  0.9524 0.98775 0.99457 0.99817 0.99941 1.00000
````
This summary tells us that PC1 accounts for 95.24% of the variation in the set. The PCA plot also shows this, as all the specimens are clustered fairly tightly around the x-axis. The data have plotted into two clusters, but we can't tell which specimens occur in each cluster without adding additonal information onto the plot.

We can easily check where species are plotting by color coding the data. I created a spreadsheet with this information called `specimenlist.csv` and loaded it using the following:

````r
> specimenlist <- read.csv("specimenlist.csv", header = TRUE)
>
> specimenlist
      Specimen    Species
1   Specimen 1     noetia
2   Specimen 2     noetia
3   Specimen 3     noetia
4   Specimen 4     noetia
5   Specimen 5     noetia
6   Specimen 6     noetia
7   Specimen 7     noetia
8   Specimen 8     noetia
9   Specimen 9     noetia
10 Specimen 10  ponderosa
11 Specimen 11  ponderosa
12 Specimen 12 transversa
13 Specimen 13 transversa
14 Specimen 14 transversa
````
Then we can replot the data by using some of the additional arguments in the `plotTangentSpace` function:
````r
## Color code by species

specimenlist <- read.csv("specimenlist.csv", header = TRUE)

plotTangentSpace(arcsGPA$coords, 
                 groups = specimenlist$Species,
                 legend = TRUE)
````
