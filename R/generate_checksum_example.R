# Example - generating checksums with many inputs

## Load/install libraries
# install.packages("dplyr")
# install.packages("readr")
library(dplyr)
library(readr)

## Source ICP checksum function etc.
source("icp_checksum.R")

## Generate a random list of ICP numbers (sans checksum)
# random_ICP <- function(n){paste0("0000", ceiling(runif(n, 1, 9) * 100000), "TR")}

## Read in a list of ICPs
ICP_list <- read_csv("random_ICP_list_input.csv")

## Generate checksums for the list of ICPs
ICP_list_new <- ICP_list %>% 
  mutate(
    checksum = sapply(ICP, generate_ICP_checksum)
    , ICP_with_checksum = paste0(ICP, checksum)
  )

## Write back to CSV
write_csv(ICP_list_new, "random_ICP_list_output.csv")



