# impassago
Imputation, genome-wide association and gene ontology tool.

### Computer specification
impassago has been tested on Ubuntu 16.04 (64-bit), running on an Intel Core i7 CPU @ 4.00GHz with 24GB RAM
Hard drive space needed will depend on size of data set. 
We have run a 7500 person x 2.5 million SNP study on 200 GB hard drive space.

### Basic setup 
The next two commands will install R and dependencies. 
You may be able to skip these if you have used R before

#### R V>3.4
>sudo apt-get install r-base

#### Libraries for R to pull packages from CRAN
>sudo apt-get install -y libxml2-dev libcurl4-openssl-dev libssl-dev

### R packages
Install the required R packages

> R  
> install.packages("tidyverse")  
> source("http://bioconductor.org/biocLite.R")  
> biocLite("IRanges")  
> install.packages("data.table")  
> install.packages("bit64")  
> q()

### Usage:


./impassago.sh download

./impassago.sh check

./impassago.sh start

./impassago.sh resume

./impassago.sh report
