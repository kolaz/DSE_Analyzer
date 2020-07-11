# Load package
library(httr)

# Parsing of HTML/XML files  
library(rvest) 

# General-purpose data wrangling
library(tidyverse)  

# String manipulation
library(stringr)   

# Verbose regular expressions
library(rebus)     

# Eases DateTime manipulation
library(lubridate)


get_hist_data <- function(start,end,code){

# Make a POST request
url <-'http://dsebd.org/day_end_archive.php'
data <- list(
  DayEndSumDate1 = start,
  DayEndSumDate2 = end,
  Symbol = code,
  ViewDayEndArchive = "View Day End Archive"
)

res <- POST(url, body = data, encode = "form", verbose())
data_file <- read_html(res)

table <- day_end_archive %>% 
  html_nodes("cellspacing") %>%
  html_text() %>%
  as.numeric()

return table
}

print(get_hist_data('2020-03-01','2020-03-02','ACI'))