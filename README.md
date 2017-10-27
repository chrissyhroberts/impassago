# impassago
Imputation, genome-wide association and gene ontology tool.


### Computer specification
impassago has been tested on Ubuntu 
x GB Hard drive space

## Requirements
R V>3.4

## R packages
> R  
> install.packages("tidyverse")  
> source("http://bioconductor.org/biocLite.R")  
> biocLite("IRanges")  
> install.packages("data.table")
> install.packages("bit64")


Usage:

./impassago.sh prepare  - doesn't do anything  

./impassago.sh download

./impassago.sh check

./impassago.sh start

./impassago.sh resume

./impassago.sh report
