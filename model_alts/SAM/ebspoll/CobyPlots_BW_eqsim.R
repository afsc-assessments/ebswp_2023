##############################################
# Coby stuff
# Extract yield data (landings) - mean version
##############################################

# Sourced from BW_eqsim_2016.r
pdf("CobyPlots.pdf")

data.95 <- SIM$rbp
x.95 <- data.95[data.95$variable == "Landings",]$Ftarget
y.95 <- data.95[data.95$variable == "Landings",]$Mean
x.95 <- x.95[2:length(x.95)]
y.95 <- y.95[2:length(y.95)]

# Plot curve with 95% line
#windows(width = 10, height = 7)
par(mfrow = c(1,1), mar = c(5,4,2,1), mgp = c(3,1,0))
#if (savePlots) tiff(file=paste(eqPath,"EqSim_",stockName,"_Mean_Land.tiff",sep=""),height=hght,width=wth, units = "in", res=72)
plot(x.95, y.95, ylim = c(0, max(y.95, na.rm = TRUE)),
     xlab = "Total catch F", ylab = "Mean landings")
yield.p95 <- 0.95 * max(y.95, na.rm = TRUE)
abline(h = yield.p95, col = "blue", lty = 1)

# Fit loess smoother to curve
x.lm <- loess(y.95 ~ x.95, span = 0.2)
lm.pred <- data.frame(x = seq(min(x.95), max(x.95), length = 1000),
                      y = rep(NA, 1000))
lm.pred$y <- predict(x.lm, newdata = lm.pred$x) 
lines(lm.pred$x, lm.pred$y, lty = 1, col = "red")
points(x = SIM$Refs["lanF","meanMSY"], 
       y = predict(x.lm, newdata = SIM$Refs["lanF","meanMSY"]),
       pch = 16, col = "blue")

# Limit fitted curve to values greater than the 95% cutoff
lm.pred.95 <- lm.pred[lm.pred$y >= yield.p95,]
fmsy.lower <- min(lm.pred.95$x)
fmsy.upper <- max(lm.pred.95$x)
abline(v = c(fmsy.lower, fmsy.upper), lty = 8, col = "blue")
abline(v = SIM$Refs["lanF","meanMSY"], lty = 1, col = "blue")
legend(x = "bottomright", bty = "n", cex = 1.0, 
       title = "F(msy)", title.col = "blue",
       legend = c(paste0("lower = ", round(fmsy.lower,3)),
                  paste0("mean = ", round(SIM$Refs["lanF","meanMSY"],3)), 
                  paste0("upper = ", round(fmsy.upper,3))))

fmsy.lower.mean <- fmsy.lower
fmsy.upper.mean <- fmsy.upper
landings.lower.mean <- lm.pred.95[lm.pred.95$x == fmsy.lower.mean,]$y	
landings.upper.mean <- lm.pred.95[lm.pred.95$x == fmsy.upper.mean,]$y

# Repeat for 95% of yield at F(05):
f05 <- SIM$Refs["catF","F05"]
yield.f05 <- predict(x.lm, newdata = f05)
points(f05, yield.f05, pch = 16, col = "green")
yield.f05.95 <- 0.95 * yield.f05
abline(h = yield.f05.95, col = "green")
lm.pred.f05.95 <- lm.pred[lm.pred$y >= yield.f05.95,]
f05.lower <- min(lm.pred.f05.95$x)
f05.upper <- max(lm.pred.f05.95$x)
abline(v = c(f05.lower,f05.upper), lty = 8, col = "green")
abline(v = f05, lty = 1, col = "green")
legend(x = "right", bty = "n", cex = 1.0, 
       title = "F(5%)", title.col = "green",
       legend = c(paste0("lower = ", round(f05.lower,3)),
                  paste0("estimate = ", round(f05,3)),
                  paste0("upper = ", round(f05.upper,3))))

#if (savePlots) dev.off()

################################################
# Extract yield data (landings) - median version

data.95 <- SIM$rbp
x.95 <- data.95[data.95$variable == "Landings",]$Ftarget
y.95 <- data.95[data.95$variable == "Landings",]$p50

# Plot curve with 95% line
#windows(width = 10, height = 7)
par(mfrow = c(1,1), mar = c(5,4,2,1), mgp = c(3,1,0))
# if (savePlots) tiff(file=paste(eqPath,"EqSim_",stockName,"_Median_Land.tiff",sep=""),height=hght,width=wth, units = "in", res=72)
plot(x.95, y.95, ylim = c(0, max(y.95, na.rm = TRUE)),
     xlab = "Total catch F", ylab = "Median landings")
yield.p95 <- 0.95 * max(y.95, na.rm = TRUE)
abline(h = yield.p95, col = "blue", lty = 1)

# Fit loess smoother to curve
x.lm <- loess(y.95 ~ x.95, span = 0.2)
lm.pred <- data.frame(x = seq(min(x.95), max(x.95), length = 1000),
                      y = rep(NA, 1000))
lm.pred$y <- predict(x.lm, newdata = lm.pred$x) 
lines(lm.pred$x, lm.pred$y, lty = 1, col = "red")

# Find maximum of fitted curve - this will be the new median (F(msy)
Fmsymed <- lm.pred[which.max(lm.pred$y),]$x
Fmsymed.landings <- lm.pred[which.max(lm.pred$y),]$y

# Overwrite Refs table
SIM$Refs[,"medianMSY"] <- NA
SIM$Refs["lanF","medianMSY"] <- Fmsymed
SIM$Refs["landings","medianMSY"] <- Fmsymed.landings

# Add maximum of medians to plot
points(x = SIM$Refs["lanF","medianMSY"], 
       y = predict(x.lm, newdata = SIM$Refs["lanF","medianMSY"]),
       pch = 16, col = "blue")

# Limit fitted curve to values greater than the 95% cutoff
lm.pred.95 <- lm.pred[lm.pred$y >= yield.p95,]
fmsy.lower <- min(lm.pred.95$x)
fmsy.upper <- max(lm.pred.95$x)
abline(v = c(fmsy.lower, fmsy.upper), lty = 8, col = "blue")
abline(v = SIM$Refs["lanF","medianMSY"], lty = 1, col = "blue")
legend(x = "bottomright", bty = "n", cex = 1.0, 
       title = "F(msy)", title.col = "blue",
       legend = c(paste0("lower = ", round(fmsy.lower,3)),
                  paste0("median = ", round(SIM$Refs["lanF","medianMSY"],3)), 
                  paste0("upper = ", round(fmsy.upper,3))))

fmsy.lower.median <- fmsy.lower
fmsy.upper.median <- fmsy.upper
landings.lower.median <- lm.pred.95[lm.pred.95$x == fmsy.lower.median,]$y
landings.upper.median <- lm.pred.95[lm.pred.95$x == fmsy.upper.median,]$y

# Repeat for 95% of yield at F(05):
f05 <- SIM$Refs["catF","F05"]
yield.f05 <- predict(x.lm, newdata = f05)
points(f05, yield.f05, pch = 16, col = "green")
yield.f05.95 <- 0.95 * yield.f05
abline(h = yield.f05.95, col = "green")
lm.pred.f05.95 <- lm.pred[lm.pred$y >= yield.f05.95,]
f05.lower <- min(lm.pred.f05.95$x)
f05.upper <- max(lm.pred.f05.95$x)
abline(v = c(f05.lower,f05.upper), lty = 8, col = "green")
abline(v = f05, lty = 1, col = "green")
legend(x = "right", bty = "n", cex = 1.0, 
       title = "F(5%)", title.col = "green",
       legend = c(paste0("lower = ", round(f05.lower,3)),
                  paste0("estimate = ", round(f05,3)),
                  paste0("upper = ", round(f05.upper,3))))

#if (savePlots) dev.off()


# Estimate implied SSB for each F output

x.95 <- data.95[data.95$variable == "Spawning stock biomass",]$Ftarget
b.95 <- data.95[data.95$variable == "Spawning stock biomass",]$p50

# Plot curve with 95% line
##windows(width = 10, height = 7)
par(mfrow = c(1,1), mar = c(5,4,2,1), mgp = c(3,1,0))
#if (savePlots) tiff(file=paste(eqPath,"EqSim_",stockName,"_Median_SSB.tiff",sep=""),height=hght,width=wth, units = "in", res=72)
plot(x.95, b.95, ylim = c(0, max(b.95, na.rm = TRUE)),
     xlab = "Total catch F", ylab = "Median SSB")

# Fit loess smoother to curve
b.lm <- loess(b.95 ~ x.95, span = 0.2)
b.lm.pred <- data.frame(x = seq(min(x.95), max(x.95), length = 1000),
                        y = rep(NA, 1000))
b.lm.pred$y <- predict(b.lm, newdata = b.lm.pred$x) 
lines(b.lm.pred$x, b.lm.pred$y, lty = 1, col = "red")

# Estimate SSB for median F(msy) and range
b.msymed <- predict(b.lm, newdata = Fmsymed)
b.medlower <- predict(b.lm, newdata = fmsy.lower.median)
b.medupper <- predict(b.lm, newdata = fmsy.upper.median)
abline(v = c(fmsy.lower.median, Fmsymed, fmsy.upper.median), col = "blue", lty = c(8,1,8))
points(x = c(fmsy.lower.median, Fmsymed, fmsy.upper.median), 
       y = c(b.medlower, b.msymed, b.medupper), col = "blue", pch = 16)
legend(x = "topright", bty = "n", cex = 1.0, 
       title = "F(msy)", title.col = "blue",
       legend = c(paste0("lower = ", round(b.medlower,0)),
                  paste0("median = ", round(b.msymed,0)),
                  paste0("upper = ", round(b.medupper,0))))

#if (savePlots) dev.off()

# Update summary table with John's format

SIM$Refs <- SIM$Refs[,!(colnames(SIM$Refs) %in% c("FCrash05","FCrash50"))]
SIM$Refs <- cbind(SIM$Refs, Medlower = rep(NA,6), Meanlower = rep(NA,6), 
                  Medupper = rep(NA,6), Meanupper = rep(NA,6))

SIM$Refs["lanF","Medlower"] <- fmsy.lower.median
SIM$Refs["lanF","Medupper"] <- fmsy.upper.median
SIM$Refs["lanF","Meanlower"] <- fmsy.lower.mean
SIM$Refs["lanF","Meanupper"] <- fmsy.upper.mean

SIM$Refs["landings","Medlower"] <- landings.lower.median
SIM$Refs["landings","Medupper"] <- landings.upper.median
SIM$Refs["landings","Meanlower"] <- landings.lower.mean
SIM$Refs["landings","Meanupper"] <- landings.upper.mean

SIM$Refs["lanB","medianMSY"] <- b.msymed
SIM$Refs["lanB","Medlower"] <- b.medlower
SIM$Refs["lanB","Medupper"] <- b.medupper

# Reference point estimates
#cat("\nReference point estimates:\n")
#print(round(SIM$Refs,3))

write.csv(round(SIM$Refs,3), paste("EqSim_",stockName,"_MSYandLim.csv",sep=""))

