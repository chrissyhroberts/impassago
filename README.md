# impassago  

#### Imputation, genome-wide association and gene ontology tool.  

Impassago provides the non-expert user with an out of the box tool for automation of a common set of GWAS data analyses with a view to identifying novel avenues for further study. The Impassago tool combines Plink, Impute2, Emmax and GenGen to efficiently and automatically QC, impute with 1000 Genomes, perform mixed model association tests, perform pathway analyses and generate reports on SNP data.

The tool generates two scripts: one for use on a single computer via 'parallel' and one for use on high performance clusters by calling 'qsub'. Both scripts are configurable for alternatives.


Contact: mark.preston@nibsc.org  

### Computer specification
impassago has been tested on Ubuntu 16.04 (64-bit), running on an Intel Core i7 CPU @ 4.00GHz with 24GB RAM  
Hard drive space needed will depend on size of data set  
We have run a 7500 person x 2.5 million SNP study on 200 GB hard drive space  

### Basic setup 
The next two commands will install R and dependencies. 
You may be able to skip these if you have used R before

#### R V>3.4
>sudo apt-get install r-base

#### Libraries for R to pull packages from CRAN
>sudo apt-get install -y libxml2-dev libcurl4-openssl-dev libssl-dev

#### R packages
Install the required R packages

> R  
> install.packages("tidyverse")  
> source("http://bioconductor.org/biocLite.R")  
> biocLite("IRanges")  
> install.packages("data.table")  
> install.packages("bit64")  
> q()

### Usage:
> ./impassago.sh prepare
Doesn't do anything

> ./impassago.sh download

#### detected problem here. if any issues during install. second attempt has another issue 'failed to create symbolic link './calculate_gsea.pl' : file exists

> ./impassago.sh check

Just echos 'check'

> ./impassago.sh start

Just echos 'start'

> ./impassago.sh resume
Just echos 'resume
'

> ./impassago.sh report
Just echos 'report'

> ./impassago.sh filter
Just echos 'report'
