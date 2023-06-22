# Data-rich case --------------------------------------------------
## Using Stock Synthesis 3 v3.30.19.01
## Website: https://github.com/nmfs-stock-synthesis/stock-synthesis

# Install required R packages -------------------------------------
devtools::load_all()
required_pkg <- c(
  "devtools", "here"
)

pkg_to_install <- required_pkg[!(required_pkg %in%
                                   installed.packages()[, "Package"])]
if (length(pkg_to_install)) install.packages(pkg_to_install)

lapply(required_pkg, library, character.only = TRUE)

devtools::install_github("r4ss/r4ss",
                         ref = "c53f82fcfb3f54296d79ba3a4163990150981285"
)
getwd()
library(r4ss)
library(tidyverse)
# get FMSY
r1 <- SS_output(dir = '.'); #SS_plots(r1)
r2 <- SS_output(dir = '../selvary'); 
r3 <- SS_output(dir = '../Hake_2023_Model_Files'); 
mods <- SSgetoutput(dirvec = c(".", "../selvary") )
modsum<-SSsummarize(mods)
SSplotComparisons(modsum)

retro(
  dir = ".", # wherever the model files are
  oldsubdir = "", # subfolder within dir
  newsubdir = "retrospectives", # new place to store retro runs within dir
  years = 0:-10 # years relative to ending year of model
)
retroModels <- SSgetoutput(dirvec = file.path(
  '.', "retrospectives",
  paste("retro", 0:-10, sep = "")
))
# summarize the model results
retroSummary <- SSsummarize(retroModels)
# create a vector of the ending year of the retrospectives
endyrvec <- retroSummary[["endyrs"]] + 0:-10
# make plots comparing the 6 models
SSplotComparisons(retroSummary,
                  endyrvec = endyrvec,
                  legendlabels = paste("Data", 0:-10, "years")
)
dev.off()

# calculate Mohn's rho, a diagnostic value
rho_output <- SSmohnsrho(
  summaryoutput = retroSummary,
  endyrvec = endyrvec,
  startyr = retroSummary[["endyrs"]] - 5,
  verbose = FALSE
)

rho_output

names(r2$timeseries)
names(r2$stdtable)
(grep("SSB",r2$stdtable$name)
names(r2)[grep("cat",names(r2))]
names(r2)[grep("bio",names(r2))]
names(r2)[grep("Fec",names(r2))]
tail(r2$catch)
(r2$biology$Spawn)
(r2$biology$GP)
(r2$biology$Mat_len)
(r2$biology$Fecundity)
names(r2)
names(r2$biology)
names(r2$catage)
(r2$catage)
(r2$timeseries$Era)
df <- data.frame(year=r2$timeseries$Yr,model="Flex",SSB= r2$timeseries$SpawnBio) |>  filter(year>1963,year<2023)
df |> ggplot(aes(x=year,y=SSB)) + geom_line() + ggthemes::theme_few() + ylim(c(0,NA))
df
(r2$Fecundity_option)

df<-r2$SPAWN_RECR_CURVE#[,c(3:4)]

df$year=as.numeric(rownames(df))
df <- as_tibble(df)
df |> filter(year>1963,year<2023) |> ggplot(aes(x=year,y=SSB)) + geom_line()

dev.off()


# plots the results

# Case 0: default stock assessment run ----------------------------
# Load simulated input data
source(here::here("Rscript", "simulation.R"))
source(here::here("Rscript", "load_indices.R"))
file_path <- here::here("data", "data_rich")

depletion <- FALSE
depletion_ratio <- 0.8 # tried values between 0.3 - 0.8

model_year <- 1985:2012
projection_year <- 2013:2017

generate_ss3(
  file_path = file_path,
  r0 = 12, steepness = 0.5, sigmar = 0.25,
  projection_f = 0.75, projection_catch = NULL,
  sa_data = sa_data, model_year = model_year,
  projection_year = projection_year,
  use_depletion = FALSE, depletion_ratio = NULL
)

# Run SS3 ----------------------------------------------------------
originalwd <- getwd()
setwd(file_path)
system(paste(file.path(file_path, "ss_win.exe"), file.path(file_path, "data.ss"), sep = " "), show.output.on.console = TRUE)

# get FMSY
r1 <- SS_output(dir = '.'); SS_plots(r1)
r2 <- SS_output(dir = '../selvary'); SS_plots(r2)
# plots the results

time_id <- seq(1, nrow(biomass[[1]]), by = 12)
biomass_ewe <- apply(biomass[[1]][, age_name], 1, sum) * 1000000

par(mfrow=c(2,2))
model_year_id <- which(r1$timeseries$Yr %in% model_year)
projection_year_id <- which(r1$timeseries$Yr %in% projection_year)
ylim <- range(biomass_ewe[time_id], r1$timeseries$Bio_all)
plot(c(model_year, projection_year),
     biomass_ewe[time_id],
     xlab = "Year", ylab = "Biomass (mt)",
     ylim = ylim,
     pch = 16
)
lines(model_year, r1$timeseries$Bio_all[model_year_id])
lines(projection_year,
      r1$timeseries$Bio_all[projection_year_id],
      lty=2)
legend("bottomleft",
       c("EWE", "SS3 Estimation", "SS3 projection"),
       bty="n",
       pch=c(16, NA, NA),
       lty=c(NA, 1, 2))

# Abundance
waa <- read_ewe_output(
  file_path = here::here("data", "ewe", "7ages", "ecosim_with_environmental_driver", "amo_pcp"),
  file_names = "weight_monthly.csv",
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = functional_groups,
  figure_colors = NULL
)

abundance_ewe <- apply(biomass[[1]][, age_name]*1000000/waa[[1]][, age_name], 1, sum)[time_id]

ylim = range(abundance_ewe, ss3list$timeseries$`SmryNum_SX:1_GP:1`*1000)
plot(c(model_year, projection_year),
     abundance_ewe,
     xlab = "Year", ylab = "Abundance",
     ylim = ylim,
     pch = 16
)

lines(model_year, ss3list$timeseries$`SmryNum_SX:1_GP:1`[model_year_id]*1000)
lines(projection_year,
      ss3list$timeseries$`SmryNum_SX:1_GP:1`[projection_year_id]*1000,
      lty=2)
legend("topright",
       c("EWE", "SS3 Estimation", "SS3 projection"),
       bty="n",
       pch=c(16, NA, NA),
       lty=c(NA, 1, 2))

# Recruitment
waa <- read_ewe_output(
  file_path = here::here("data", "ewe", "7ages", "ecosim_with_environmental_driver", "amo_pcp"),
  file_names = "weight_monthly.csv",
  skip_nrows = 8,
  plot = FALSE,
  figure_titles = NULL,
  functional_groups = functional_groups,
  figure_colors = NULL
)

recruit_ewe <- biomass[[1]][, "AtlanticMenhaden0"][time_id]*1000000/waa[[1]][, "AtlanticMenhaden0"][time_id]

recruit_ss3 <- data.frame(
  year = c(model_year, projection_year),
  recruit = ss3list$natage$`1`[which(ss3list$natage$`Beg/Mid`=="B" & ss3list$natage$Yr %in% c(model_year, projection_year))]*1000
)


ylim = range(recruit_ewe, recruit_ss3$recruit)
plot(c(model_year, projection_year),
     recruit_ewe,
     xlab = "Year", ylab = "Abundance of age-0 fish",
     ylim = ylim,
     pch = 16
)
lines(model_year, recruit_ss3$recruit[recruit_ss3$year %in% model_year])
lines(projection_year,
      recruit_ss3$recruit[recruit_ss3$year %in% projection_year],
      lty=2)
legend("topright",
       c("EWE", "SS3 Estimation", "SS3 projection"),
       bty="n",
       pch=c(16, NA, NA),
       lty=c(NA, 1, 2))

# Mortality
mortality <- read.csv(file = here::here("data", "ewe", "7ages", "updated_faa.csv"))
mortality_ewe <- apply(mortality[, 2:ncol(mortality)], 1, max)
#mortality_ewe <- apply(mortality[, 2:ncol(mortality)], 1, mean)

ylim <- range(mortality_ewe, ss3list$timeseries$`F:_1`)
plot(c(model_year, projection_year),
     mortality_ewe,
     xlab = "Year", ylab = "Mortality",
     ylim = ylim,
     pch = 16
)
lines(model_year, ss3list$timeseries$`F:_1`[model_year_id])
lines(projection_year,
      ss3list$timeseries$`F:_1`[projection_year_id],
      lty=2)
legend("topright",
       c("EWE F", "SS3 F", "SS3 FMSY"),
       bty="n",
       pch=c(16, NA, NA),
       lty=c(NA, 1, 2))


# Linear regression models from cases 1 - 4 using "true" values from EwE------------------------

# use abundance instead of biomass
biomass_ewe <- apply(biomass[[1]][, age_name]*1000000/waa[[1]][, age_name], 1, sum)

lm_slope <- data.frame(
  case = "True indices",
  amo = NA,
  pcp = NA,
  bassB = NA,
  price = NA
)

year_id <- seq(1, nrow(amo_unsmooth_lag1), by = 12)
index_year <- c(model_year, projection_year)

amo <- amo_unsmooth_lag1[year_id, ]
amo_lm <- lm(biomass_ewe[time_id] ~ amo$raw_value)
amo_fit <- fitted(amo_lm)
lm_slope$amo <- paste0(
  round(summary(amo_lm)$coefficients[2, 1], digits = 2),
  if(summary(amo_lm)$coefficients[2, 4] <= 0.05) {"*"})

pcp <- precipitation[year_id, ]
pcp_lm <- lm(biomass_ewe[time_id] ~ pcp$raw_value)
pcp_fit <- fitted(pcp_lm)
lm_slope$pcp <- paste0(
  round(summary(pcp_lm)$coefficients[2, 1], digits = 2),
  if(summary(pcp_lm)$coefficients[2, 4] <= 0.05) {"*"})

bassB <- bass_bio[bass_bio$Year %in% index_year, ]
bassB_lm <- lm(biomass_ewe[time_id] ~ bassB$bass_bio)
bassB_fit <- fitted(bassB_lm)
lm_slope$bassB <- paste0(
  round(summary(bassB_lm)$coefficients[2, 1], digits = 2),
  if(summary(bassB_lm)$coefficients[2, 4] <= 0.05) {"*"})

sub_menhadenD <- menhaden_dollars$Inflation.Adjust.Price.Per.MT[menhaden_dollars$Year %in% index_year]
dollars_lm <- lm(biomass_ewe[time_id] ~ sub_menhadenD)
dollars_fit <- fitted(dollars_lm)
lm_slope$price <- paste0(
  round(summary(dollars_lm)$coefficients[2, 1], digits = 2),
  if(summary(dollars_lm)$coefficients[2, 4] <= 0.05) {"*"})

par(mfrow = c(2, 2))

plot(amo$raw_value, biomass_ewe[time_id],
     xlab = "AMO raw values",
     ylab = "Menhaden-like species B from OM"
)
lines(amo$raw_value, amo_fit, lty = 2, col = "blue")

plot(pcp$raw_value, biomass_ewe[time_id],
     xlab = "Precipitation raw values",
     ylab = "Menhaden-like species B from OM"
)
lines(pcp$raw_value, pcp_fit, lty = 2, col = "blue")

plot(bassB$bass_bio, biomass_ewe[time_id],
     xlab = "Biomass of Striped bass",
     ylab = "Menhaden-like species B from OM"
)
lines(bassB$bass_bio, bassB_fit, lty = 2, col = "blue")

plot(sub_menhadenD, biomass_ewe[time_id],
     xlab = "Menhaden dollars",
     ylab = "Menhaden-like species B from OM"
)
lines(sub_menhadenD, dollars_fit, lty = 2, col = "blue")

knitr::kable(lm_slope)

# Projection: cases 1 - 4 ---------------------------

lm_slope <- data.frame(
  case = 0.2,
  projection_year = 1:length(projection_year),
  amo = NA,
  pcp = NA,
  bassB = NA,
  price = NA
)

for (projection_year_id in 1:length(projection_year)){

  # abundance
  if (projection_year_id ==1) {
    menhaden_b <- ss3list$timeseries$`SmryNum_SX:1_GP:1`[model_year_id]
  } else {
    menhaden_b <- c(ss3list$timeseries$`SmryNum_SX:1_GP:1`[model_year_id], ss3list$timeseries$`SmryNum_SX:1_GP:1`[1:(projection_year_id-1)])
  }

  # biomass
  # if (projection_year_id ==1) {
  #   menhaden_b <- ss3list$timeseries$Bio_all[model_year_id]
  # } else {
  #   menhaden_b <- c(ss3list$timeseries$Bio_all[model_year_id], ss3list$timeseries$Bio_all[1:(projection_year_id-1)])
  # }


  year_id <- seq(1, nrow(amo_unsmooth_lag1), by = 12)[1:(length(model_year)+projection_year_id-1)]

  if (projection_year_id == 1) {
    index_year = model_year
  } else {
    index_year <- c(model_year, projection_year[1:(projection_year_id-1)])
  }


  # Linear regression model -----------------------------------------

  amo <- amo_unsmooth_lag1[year_id, ]
  amo_lm <- lm(menhaden_b ~ amo$raw_value)
  summary(amo_lm)
  amo_fit <- fitted(amo_lm)
  lm_slope$amo[projection_year_id] <- paste0(
    round(summary(amo_lm)$coefficients[2, 1], digits = 2),
    if(summary(amo_lm)$coefficients[2, 4] <= 0.05) {"*"})

  pcp <- precipitation[year_id, ]
  pcp_lm <- lm(menhaden_b ~ pcp$raw_value)
  summary(pcp_lm)
  pcp_fit <- fitted(pcp_lm)
  lm_slope$pcp[projection_year_id] <- paste0(
    round(summary(pcp_lm)$coefficients[2, 1], digits = 2),
    if(summary(pcp_lm)$coefficients[2, 4] <= 0.05) {"*"})

  bassB <- bass_bio[bass_bio$Year %in% index_year, ]
  bassB_lm <- lm(menhaden_b ~ bassB$bass_bio)
  summary(bassB_lm)
  bassB_fit <- fitted(bassB_lm)
  lm_slope$bassB[projection_year_id] <- paste0(
    round(summary(bassB_lm)$coefficients[2, 1], digits = 2),
    if(summary(bassB_lm)$coefficients[2, 4] <= 0.05) {"*"})

  sub_menhaden_b <- menhaden_b[index_year %in% menhaden_dollars$Year]
  sub_menhadenD <- menhaden_dollars$Inflation.Adjust.Price.Per.MT[menhaden_dollars$Year %in% index_year]
  dollars_lm <- lm(sub_menhaden_b ~ sub_menhadenD)
  summary(dollars_lm)
  dollars_fit <- fitted(dollars_lm)
  lm_slope$price[projection_year_id] <- paste0(
    round(summary(dollars_lm)$coefficients[2, 1], digits = 2),
    if(summary(dollars_lm)$coefficients[2, 4] <= 0.05) {"*"})

  if (projection_year_id == length(projection_year)){

    par(mfrow = c(2, 2))

    plot(amo$raw_value, menhaden_b,
         xlab = "AMO raw values",
         ylab = "Biomass of menhaden-like species"
    )
    lines(amo$raw_value, amo_fit, lty = 2, col = "blue")

    plot(pcp$raw_value, menhaden_b,
         xlab = "Precipitation raw values",
         ylab = "Biomass of menhaden-like species"
    )
    lines(pcp$raw_value, pcp_fit, lty = 2, col = "blue")

    plot(bassB$bass_bio, menhaden_b,
         xlab = "Biomass of Striped bass",
         ylab = "Biomass of menhaden-like species"
    )
    lines(bassB$bass_bio, bassB_fit, lty = 2, col = "blue")

    plot(sub_menhadenD, sub_menhaden_b,
         xlab = "Menhaden price",
         ylab = "Biomass of menhaden-like species"
    )
    lines(sub_menhadenD, dollars_fit, lty = 2, col = "blue")

  }


  # status of indicators --------------------------------------------

  amo_soi <- calc_soi(
    indicator_data = amo$raw_value,
    slope = coef(amo_lm)[2]
  )

  pcp_soi <- calc_soi(
    indicator_data = pcp$raw_value,
    slope = coef(pcp_lm)[2]
  )

  bassB_soi <- calc_soi(
    indicator_data = bassB$bass_bio,
    slope = coef(bassB_lm)[2]
  )

  dollars_soi <- calc_soi(
    indicator_data = sub_menhadenD,
    slope = coef(dollars_lm)[2]
  )

  if (projection_year_id == 1) {
    scaled_data <- data.frame(
      year = model_year,
      projection_year_id = projection_year_id,
      amo = scale(amo$raw_value)[,1],
      pcp = scale(pcp$raw_value)[,1],
      bassB = scale(bassB$bass_bio)[,1],
      price = scale(sub_menhadenD)[,1],
      menhadenB = scale(menhaden_b)[,1]
    )

    soi_data <- data.frame(
      year = model_year,
      projection_year_id = projection_year_id,
      amo = amo_soi,
      pcp = pcp_soi,
      bass_b = bassB_soi,
      price = dollars_soi
    )
  } else{
    scaled_data <- rbind(
      scaled_data,
      data.frame(
        year = index_year,
        projection_year_id = projection_year_id,
        amo = scale(amo$raw_value)[,1],
        pcp = scale(pcp$raw_value)[,1],
        bassB = scale(bassB$bass_bio)[,1],
        price = scale(sub_menhadenD)[,1],
        menhadenB = scale(menhaden_b)[,1]
      )
    )

    soi_data <- rbind(
      soi_data,
      data.frame(
        year = index_year,
        projection_year_id = projection_year_id,
        amo = amo_soi,
        pcp = pcp_soi,
        bass_b = bassB_soi,
        price = dollars_soi
      )
    )
  }



  # Adjusted FMSY ----------------------------------------------------

  if (projection_year_id == 1) {
    Bt_BMSY <- ss3list$Kobe$B.Bmsy[length(model_year)]

  } else {
    Bt_BMSY <- ss3list$Kobe$B.Bmsy[length(model_year)+projection_year_id-1]
  }

  ss3_fmsy <- rnorm(1000, ss3list$derived_quants$Value[ss3list$derived_quants$Label == "annF_MSY"], 0.5)
  ss3_Bt_BMSY <- rep(Bt_BMSY, 1000)

  ss3_fmsy[ss3_fmsy<0] <- 0.1
  amo_fmsy <- adjust_projection_jabba(
    FMSY = ss3_fmsy,
    soi = tail(amo_soi, n = 1),
    Bt_BMSY = ss3_Bt_BMSY
  )
  pcp_fmsy <- adjust_projection_jabba(
    FMSY = ss3_fmsy,
    soi = tail(pcp_soi, n = 1),
    Bt_BMSY = ss3_Bt_BMSY
  )
  bassB_fmsy <- adjust_projection_jabba(
    FMSY = ss3_fmsy,
    soi = tail(bassB_soi, n = 1),
    Bt_BMSY = ss3_Bt_BMSY
  )
  dollars_fmsy <- adjust_projection_jabba(
    FMSY = ss3_fmsy,
    soi = tail(dollars_soi, n = 1),
    Bt_BMSY = ss3_Bt_BMSY
  )

  if (projection_year_id == 1){
    fmsy_data <- data.frame(
      iter = 1:length(amo_fmsy),
      projection_year_id = projection_year_id,
      ss3 = ss3_fmsy,
      amo = amo_fmsy,
      pcp = pcp_fmsy,
      bassB = bassB_fmsy,
      price = dollars_fmsy
    )
  } else {
    fmsy_data <- rbind(
      fmsy_data,
      data.frame(
        iter = 1:length(amo_fmsy),
        projection_year_id = projection_year_id,
        ss3 = ss3_fmsy,
        amo = amo_fmsy,
        pcp = pcp_fmsy,
        bassB = bassB_fmsy,
        price = dollars_fmsy
      )
    )
  }

}



scaled_data_melt <- reshape2::melt(
  scaled_data,
  id = c("year", "projection_year_id")
)
scaled_data_melt$projection_year_id <- as.factor(scaled_data_melt$projection_year_id)


ggplot(scaled_data_melt, aes(x = year, y = value, color = projection_year_id)) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  labs(
    title = "Scaled Indices",
    x = "Year",
    y = "Scaled Indices"
  ) +
  theme_bw()


soi_data_melt <- reshape2::melt(
  soi_data,
  id = c("year", "projection_year_id")
)
soi_data_melt$projection_year_id <- as.factor(soi_data_melt$projection_year_id)

ggplot(soi_data_melt, aes(x = year, y = value, color = projection_year_id)) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  labs(
    title = "Status of Indicators",
    x = "Year",
    y = "Status of Indicators"
  ) +
  theme_bw()

fmsy_data_melt <- reshape2::melt(
  fmsy_data,
  id = c("iter", "projection_year_id")
)
fmsy_data_melt$projection_year_id <- as.factor(fmsy_data_melt$projection_year_id)

# ggplot(fmsy_data_melt, aes(x = iter, y = value, color = projection_year_id)) +
#   geom_line() +
#   facet_wrap(~variable) +
#   labs(
#     title = "FMSY",
#     x = "Iteration",
#     y = "FMSY"
#   ) +
#   theme_bw()

ggplot(fmsy_data_melt, aes(x=variable, y = value, color = projection_year_id)) +
  geom_boxplot()+
  labs(
    title = "FMSY from SS3 and adjusted FMSY",
    x = "",
    y = "FMSY"
  ) +
  theme_bw()

fmsy_data_melt_median <- aggregate(value ~ projection_year_id+variable, data = fmsy_data_melt, median)
fmsy_data_melt_median$projection_year_id <- as.numeric(fmsy_data_melt_median$projection_year_id)

ggplot(fmsy_data_melt_median, aes(x = projection_year_id, y = value, color = variable)) +
  geom_line() +
  labs(
    title = "Median FMSY from SS3 and adjusted FMSY",
    x = "",
    y = "FMSY"
  ) +
  theme_bw()

