# Title:                      Bycatch in BSAI pollock fisheries
# Purpose:                    Determine proportions of each bycatch species group in BSAI pollock fishery
# Author:                     Andy Kingham
# Contact:                    andy.kingham@noaa.gov
# Create date:                2020/07/22

# Notes:                      1. Object naming conventions:

#                                  a.  df_     = data.frame
#                                  b.  fn_     = function
#                                  c.  plot_   = plot
#                                  d.  ts_     = time series

#                             2. Uses library svDialogs to have the user input the desired date range.
#                                This defaults to June 10 thru July 26 for each year.
#                                Change the day/month combination in the dialog box that is prompted when executing the 'first_date' and 'last_date' variables.








###############################################################################
###############################################################################
# Load packages
library(ggplot2)
library(ggthemes)
library(odbc)
library(dplyr)
library(getPass)
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
options(echo=TRUE)




###############################################################################
###############################################################################
# Define odbc connection to the Oracle database
# default connection schema = your NORPAC schema, with ability to connect to NORPAC and other schemas within AFSC database
# Change "AFSC" to whatever the alias is, that is defined on your machine, in the 'ORACLE' directory.  Contact IT if assistance is needed!

channel <- dbConnect(odbc::odbc(),"AFSC",
                     UID    = rstudioapi::askForPassword("Enter your NORPAC Username: "),
                     PWD    = rstudioapi::askForPassword("Enter your NORPAC Password: "))


channel <- dbConnect(odbc::odbc(),"AFSC", UID    = 'jianelli', PWD    = 'CHgDzSUoS9$dBNC941nd8fuwaV_mTF'
)






##############
# Choose input date parameters
##############

# These will be used in the query to return the date range you chose
first_date <-  dlg_input(message = "Enter first desired month/day for haul data, in MM/DD format: ",
                         default = '06/10')$res

last_date <-   dlg_input(message = "Enter last desired month/day for haul data, in MM/DD format: ",
                         default = '08/25')$res
first_date <- "01/20"
last_date <- "10/31"





##############
# SQL queries
##############


# first go get all the species encountered in obsint.debriefed_spcomp, and assign them to a group.
# NOTE: this list accounts for all species encountered in Pollock Fishery up through 7/22/2020, and groups those.
# In the future, if new species are encountered in the pollock fishery, they will need to be added to this list to be assigned to a group.
df_spp_groups <-
  dbGetQuery(channel,
             "SELECT DISTINCT sp.species_code AS species,
                     sp.common_name,
                     CASE WHEN species_code IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 13, 14, 15, 18, 19, 31, 38, 39, 47, 49, 840, 37, 12, 23, 10, 16) THEN 'CRABS'
                          WHEN species_code IN (844, 851, 853, 854, 855, 856, 857, 861, 874, 875, 876, 878, 879, 883, 889, 893, 897, 998, 1128, 887, 849, 898, 858, 888, 871) THEN 'BIRDS'
                          WHEN species_code IN (815, 817, 819, 833, 835) THEN 'CORALS'
                          WHEN species_code IN (100, 102, 103, 104, 105, 106, 107, 108, 109, 111, 112, 114, 115, 120, 121, 140, 141, 142, 144, 145, 147, 148, 149, 143, 110, 117, 146, 137) THEN 'FLATFISHES'
                          WHEN species_code IN (899, 900, 901) THEN 'MISC/WASTE/UNIDENT'
                          WHEN species_code IN (20, 21, 22, 24, 25, 26, 27, 29, 30, 32, 33, 34, 36, 40, 41, 42, 43, 44, 45, 48, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 70, 829, 902, 978, 73, 72, 925) THEN 'OTHER INVERTS'
                          WHEN species_code IN (75, 77, 79, 80, 82, 200, 205, 206, 208, 209, 210, 215, 239, 240, 242, 249, 250, 253, 259, 280, 289, 295, 390, 430, 450, 452, 453, 459,
                                           559, 622, 679, 689, 690, 696, 700, 702, 750, 753, 759, 762, 765, 769, 770, 774, 779, 780, 781, 782, 785, 799, 805, 807, 254, 216,
                                           254, 216, 625, 113, 660, 756, 606, 211, 760, 688, 251, 199, 783, 620, 241, 563, 248, 392, 755, 456, 603, 81, 800, 650, 806, 776, 257,
                                           848, 608, 540, 619, 691, 207, 252, 260, 214, 455, 681, 99) THEN 'OTHER ROUNDFISHES'
                          WHEN species_code IN (300, 301, 303, 304, 305, 306, 307, 308, 310, 311, 320, 321, 322, 323, 324, 326, 330, 343, 344, 345, 349, 350, 352, 354, 355, 319,
                                           347, 319, 347, 550, 302, 317, 351, 325, 316, 314, 348, 315, 331) THEN 'ROCKFISHES'
                          WHEN species_code IN (220, 221, 222, 223, 224, 225, 226) THEN 'SALMON'
                          WHEN species_code IN (395, 398, 399, 400, 401, 402, 405, 407, 408, 409, 413, 414, 415, 418, 434, 440, 470, 471, 433, 425, 406, 431, 396, 411, 410, 422 ) THEN 'SCULPINS'
                          WHEN species_code IN (62, 65, 66, 67, 68, 156, 76, 78) THEN 'SHARKS'
                          WHEN species_code IN (85, 88, 89, 90, 91, 92, 94, 95, 97, 159, 162, 163, 164, 165, 167, 61, 96, 161) THEN 'SKATES'
                          WHEN species_code IN (600, 601, 602, 604, 605, 610, 614, 628, 670, 613, 618) THEN 'SMELTS'
                          WHEN species_code IN (500, 501, 525, 530, 531, 504, 505) THEN 'SNAILFISHES/LUMPSUCKERS'
                          WHEN species_code IN (28, 50, 51) THEN 'SQUIDS'
                          WHEN species_code = 201 THEN 'POLLOCK'
                          WHEN species_code = 203 THEN 'SABLEFISH'
                          WHEN species_code = 202 THEN 'PACIFIC COD'
                          WHEN species_code = 35 THEN 'JELLYFISHES'
                          WHEN species_code = 611 THEN 'HERRING'
                          WHEN species_code = 101 THEN 'HALIBUT'
                          WHEN species_code = 204 THEN 'ATKA MACKEREL'
                          WHEN species_code = 903 THEN 'MARINE MAMMALS'
                     ELSE 'UNK' END AS species_group
               FROM norpac.atl_lov_species_code sp")


# Get all species for each haul in BSAI pollock
# CAUTION: this one will take 2-4 minutes to execute on VPN!!!

df_haul_species <-
  rbind(
    # first get from the "DEBRIEFED" tables, for all data prior to the current year.
    dbGetQuery(channel,
               paste("SELECT s.cruise, s.permit, s.haul_seq, s.haul_join, s.extrapolated_weight, s.sex, s.species, s.year,
                               sp.common_name,
                               h.nmfs_area,
                               h.official_total_catch,
                               h.gear_type,
                               h.fishing_depth_fathoms,
                               h.bottom_depth_fathoms,
                               h.performance
                          FROM obsint.debriefed_haul h
                          JOIN obsint.debriefed_spcomp s
                            ON s.haul_join = h.haul_join
                          JOIN norpac.atl_lov_species_code sp
                            ON sp.species_code = s.species
                         WHERE h.nmfs_area between 500 and 549
                           AND h.gear_type = 2
                           AND h.year <= EXTRACT(year FROM sysdate) -1  -- for all data PRIOR to the current year.

                            -- This next part of the WHERE clause gets the first and last month/days, desired by the user, for haul data to return.
                            -- Then it uses a slight HACK to get the dates between the inputted dates for all years.
                            -- What it does is, it converts all of them to the year 2040, then extracts the day and month.  It works though!!
                            -- DEFAULTS to 06/10 and 07/26, to match the data requested originally by Jim.Ianelli@noaa.gov

                           AND to_date(to_char(s.haul_date, 'MM/DD')||'/2040', 'MM/DD/YYYY')
                               BETWEEN to_date('", first_date,
                     "'||'/2040', 'MM/DD/YYYY')
                                   AND to_date('", last_date,
                     "'||'/2040','MM/DD/YYYY')",
                     sep = "")
    ),
    # Next get data from "CURRENT" tables for the current year.
    dbGetQuery(channel,
               paste("SELECT s.cruise, s.permit, s.haul_seq, s.haul_join, s.weight AS extrapolated_weight, s.sex, s.species, s.year,
                               sp.common_name,
                               h.nmfs_area,
                               h.official_total_catch,
                               h.gear_type,
                               h.fishing_depth_fathoms,
                               h.bottom_depth_fathoms,
                               h.performance
                          FROM obsint.current_haul h
                          JOIN obsint.current_spcomp s
                            ON s.haul_join = h.haul_join
                          JOIN norpac.atl_lov_species_code sp
                            ON sp.species_code = s.species
                         WHERE h.nmfs_area between 500 and 549
                           AND h.gear_type = 2
                           AND h.year = EXTRACT(year FROM sysdate)

                            -- This next part of the WHERE clause gets the first and last month/days, desired by the user, for haul data to return.
                            -- Then it uses a slight HACK to get the dates between the inputted dates for all years.
                            -- What it does is, it converts all of them to the year 2040, then extracts the day and month.  It works though!!
                            -- DEFAULTS to 06/10 and 07/26, to match the data requested originally by Jim.Ianelli@noaa.gov

                           AND to_date(to_char(s.haul_date, 'MM/DD')||'/2040', 'MM/DD/YYYY')
                               BETWEEN to_date('", first_date,
                     "'||'/2040', 'MM/DD/YYYY')
                                   AND to_date('", last_date,
                     "'||'/2040','MM/DD/YYYY')",
                     sep = "")
    )
  ) %>%
  left_join(df_spp_groups)





######################
# Make summary table by species and date
######################
df_sum_spp_by_year <-
  df_haul_species %>%
  group_by(SPECIES_GROUP,
           YEAR) %>%
  summarize(TOTAL_CATCH_KG  = sum(OFFICIAL_TOTAL_CATCH)*1000,
            TOTAL_SPP_WT = sum(EXTRAPOLATED_WEIGHT)
  ) %>%
  mutate(PROP_SPP = TOTAL_SPP_WT/(TOTAL_CATCH_KG))









################
# plots
################

summary(df_sum_spp_by_year)
# Time-series for each species group
plot_ts_pollock_bycatch_spp_group_proportions <-
  (ggplot(df_sum_spp_by_year %>%
            filter(YEAR >= 2000))
   + geom_line(
     aes(x = YEAR,
         y = PROP_SPP,
         group = 1))
   + facet_wrap(.~SPECIES_GROUP,
                scales = "free_y")
   + labs(x    = '',
          y    = paste('Proportion species in catch, ', first_date, ' - ', last_date, sep = ""))
  )
plot_ts_pollock_bycatch_spp_group_proportions
ggsave("C:/Users/andy.kingham/Work/Analytical Projects/Projects/pollock_bycatch/plot_ts_pollock_bycatch_spp_proportions.png")
ggsave("C:/Users/andy.kingham/Work/Analytical Projects/Projects/pollock_bycatch/plot_ts_pollock_bycatch_spp_proportions.png")







# 2019 by species, barchart
# 2019 shows massive dip in pollock predominance, so we are interested in this year particularly.
plot_2020_pollock_bycatch_spp_group_proportions <-
  (ggplot(df_sum_spp_by_year %>%
            filter(SPECIES_GROUP != 'POLLOCK',
                   YEAR == 2020)) #filter out pollock and only for 2019
   + geom_col(aes(x = SPECIES_GROUP,
                  y = PROP_SPP,fill=SPECIES_GROUP))
   + theme_few()
   + labs(x = '',
          y = paste('Proportion species in catch, ', first_date, '/2020 - ', last_date, '/2020', sep = ""))
   + theme(axis.text.x = element_text(angle = 90,
                                      vjust = 0.5,
                                      hjust = 1),
           legend.position = "none"  )
  )
plot_2020_pollock_bycatch_spp_group_proportions
plot_2019_pollock_bycatch_spp_group_proportions
ggsave("C:/Users/andy.kingham/Work/Analytical Projects/Projects/pollock_bycatch/plot_2019_pollock_bycatch_spp_group_proportions.png")








# time series, last 5 years only, by species group, exclude pollock (for scaling)
plot_ts_pollock_bycatch_spp_group_proportions_last_5_years <-
  (ggplot(df_sum_spp_by_year %>%
            filter(SPECIES_GROUP != 'POLLOCK',
                   SPECIES_GROUP != 'ATKA MACKEREL',
                   SPECIES_GROUP != 'BIRDS',
                   SPECIES_GROUP != 'CORALS',
                   SPECIES_GROUP != 'CRABS',
                   SPECIES_GROUP != 'UNK',
                   SPECIES_GROUP != 'SCULPINS',
                   SPECIES_GROUP != 'SMELTS',
                   SPECIES_GROUP != 'MISC/WASTE/UNIDENT',
                   SPECIES_GROUP != 'OTHER INVERTS',
                   SPECIES_GROUP != 'SMELTS',
                   SPECIES_GROUP != 'SNAILFISHES/LUMPSUCKERS',
                   SPECIES_GROUP != 'MARINE MAMMALS',
                   YEAR %in% c(2000:2020))) #filter out pollock and only for the last 5 years
   + geom_area(aes(x = YEAR,
                   y = PROP_SPP,
                   fill = SPECIES_GROUP))
   + facet_wrap(.~SPECIES_GROUP)
   + theme_few()
   + labs(x = '',
          y = paste('Proportion species in catch, ', first_date, ' - ', last_date, sep = ""))
   + theme(axis.text.x = element_text(angle = 90,
                                      vjust = 0.5,
                                      hjust = 1),
           legend.position = "none")
  )
plot_ts_pollock_bycatch_spp_group_proportions_last_5_years
ggsave("C:/Users/jim.ianelli/plot_ts_pollock_bycatch_spp_group_proportions_last_5_years.png")

plot_ts_pollock <-  df_sum_spp_by_year %>% filter(SPECIES_GROUP == 'POLLOCK' , YEAR %in% c(2000:2020)) %>%
  ggplot(  aes(x = YEAR, y = PROP_SPP )) +
  geom_line(col="blue",size=2) +
  theme_few() +
  labs(x = '', y = paste('Proportion species in catch, ', first_date, ' - ', last_date, sep = ""))+
  theme(axis.text.x = element_text(angle = 90,  vjust = 0.5,  hjust = 1),
        legend.position = "none")
(plot_ts_pollock)
(plot_ts_pollock$data)
write.csv(plot_ts_pollock$data,"ForAlex2.csv")
?write.csv("ForAlex.csv",plot_ts_pollock$data)



