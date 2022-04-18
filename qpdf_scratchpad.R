library(tidyverse)
library(qpdf)
library(fs)


# https://stackoverflow.com/questions/17552917/merging-existing-pdf-files-using-r
# list of functions: https://github.com/ropensci/qpdf/blob/master/man/qpdf.Rd
# https://github.com/ropensci/qpdf
# https://qpdf.sourceforge.io/
# https://qpdf.readthedocs.io/en/stable/

# setwd
setwd("C:/Users/sdevine/Desktop")

?pdf_split
?pdf_length
?pdf_subset
?pdf_combine
?pdf_compress

# combine pdf
dir_ls()
pdf_combine(input = c("aef - first page.pdf", "AEF - Devine last 8.pdf"),
            output = "merged_pdf.pdf")



