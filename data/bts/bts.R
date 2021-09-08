library("googledrive")
library("tidyverse")
dls2010<-drive_ls("https://drive.google.com/drive/folders/1uVxPaHHGFbgLgvfl_ucFSRHjiar7UHnr")
dls2019<-drive_ls("https://drive.google.com/drive/folders/1ZkZFh4mJ0-DvvixzS8bJ9f0wYKJ8JBg-")
for (i in 1:dim(dls2010)[1]){
  drive_download(dls2010$id[i],overwrite=TRUE)
}
for (i in 1:dim(dls2019)[1]){
  drive_download(dls2019$id[i],overwrite=TRUE)
}
names(bts2019)<- substr(names(bts2019),6,100)
names(bts2010)<- substr(names(bts2010),6,100)
 df <- rbind(tibble(bts2019$biomass_uncorrected_2021.csv,type="2019"), tibble(bts2010$biomass_uncorrected_2021.csv,type="2010"))
 df <- rbind(tibble(bts2019$bootstrap_biomass.csv,type="2010"), tibble(bts2019$biomass_biomass_2019data_2010strata.csv,type="2019"))
 tibble(bts2010$biomass_biomass_2019data_2010strata.csv)
 tibble(bts2010$biomass_biomass_2019data_2010strata.csv,type="2019")
names(bts2010)
names(bts2019)
df %>% group_by(year,type)%>% summarise(biom=sum(biomass_th_t)) %>%
ggplot(aes(x=year,y=biom,color=type)) + geom_line(size=.2) 
data_dir <- "."
csv_files10 <- fs::dir_ls("2010", regexp = "\\.csv$")
csv_files19 <- fs::dir_ls("2019", regexp = "\\.csv$")
csv_files10
bts2019 <- csv_files19 %>% map(read_csv)
bts2010 <- csv_files10 %>% map(read_csv)
csv_files19