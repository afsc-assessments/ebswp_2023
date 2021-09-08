# Top -----------------------------------------------------------------------------
# Title:                      BSAI pollock fisheries otolith selector
# Purpose:                    Randomly select among otoliths collected which to age
# Author:                     Jim Ianelli
# Contact:                    Jim.Ianelli@noaa.gov
# Create date:                2021/03/02
# Notes: --------------------------#--------------------------------------------
# 1. Object naming conventions:
#                                  a.  df_     = data.frame
#                                  b.  fn_     = function
#                                  c.  plot_   = plot
#                                  d.  ts_     = time series
#                             2. Uses library svDialogs to have the user input the desired date range.
#                                This defaults to June 10 thru July 26 for each year.
#                                Change the day/month combination in the dialog box that is prompted when executing the 'first_date' and 'last_date' variables.
#
# Load packages -------------------------------------------------------------------------
library(ggplot2)
library(ggthemes)
library(dplyr)
library(getPass)
#install.packages("getPass")
#install.packages("getPass")
#install.packages("sqldf")
#install.packages("proto")
#install.packages("gsubfn")
library(scales)
library(sqldf)
library(data.table)
#install.packages("DataCombine")
#install.packages('svDialogs')
library(DataCombine)
library(svDialogs)
library(lubridate)
options(echo=TRUE)
fn_Write_Data <- function(dat=df_lw,file="LW_data.csv") {
  cat(paste(file,Sys.time(),'\n'), file="TimeStamps.dat", append=TRUE)
  write.csv(dat,row.names=FALSE,file=file) }
# Define odbc connection to the Oracle database #############################
channel <- dbConnect(odbc::odbc(),"AFSC",
                     #UID    = rstudioapi::askForPassword("Enter your NORPAC Username: "),
                     #PWD    = rstudioapi::askForPassword("Enter your NORPAC Password: "))
                     UID    = "jianelli",
                     PWD    = "Next7naiLMostly$")
#
#channel <- dbConnect(odbc::odbc(),"AFSC", UID    = 'jianelli', PWD    = 'Next7naiLMostly$' )



library(odbc)
