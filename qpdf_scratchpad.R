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


#///////////////////////////


# manually assign doc_path variable

# check files
dir_ls()

# check length
pdf_length(input = doc_path, password = "")

# split will automatically save each of the split pages as pdfs in the output directory
# pdf_subset(input = doc_path, pages = 1, output = str_c(str_sub(string = doc_path, start = 1, end = -5), "_test_1.pdf"))
# pdf_subset(input = doc_path, pages = 1:3, output = str_c(str_sub(string = doc_path, start = 1, end = -5), "_test_2.pdf"))
# pdf_subset(input = doc_path, pages = c(1, 3), output = str_c(str_sub(string = doc_path, start = 1, end = -5), "_test_3.pdf"))
# pdf_subset(input = doc_path, pages = -2, output = str_c(str_sub(string = doc_path, start = 1, end = -5), "_test_4.pdf"))

pdf_subset(input = "aef_old_version.pdf", pages = 1, output = str_c(str_sub(string = doc_path, start = 1, end = -5), "_pages_1.pdf"))
pdf_subset(input = "aef_updated_unsigned.pdf", pages = 2:9, output = str_c(str_sub(string = doc_path, start = 1, end = -5), "_pages_2_to_9.pdf"))


# combine pdf
pdf_combine(input = c(str_c(str_sub(string = doc_path, start = 1, end = -5), "_pages_1.pdf"),
                      str_c(str_sub(string = doc_path, start = 1, end = -5), "_pages_2_to_9.pdf")),
            output = str_c(str_sub(string = doc_path, start = 1, end = -5), ".pdf"))

# remove unnecessary files
file_delete(path = c(str_c(str_sub(string = doc_path, start = 1, end = -5), "_pages_1.pdf"),
                     str_c(str_sub(string = doc_path, start = 1, end = -5), "_pages_2_to_9.pdf")))

