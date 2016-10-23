rm(list=ls())
library(ggplot2)
library(reshape2)
library(KernSmooth)

# ---------------- DATA -----------------------------------------

data <- dget('kobe_data.txt')
dta <- data[[1]] # fishing mortality and spawning biomas
v <- data[[2]] # Reference points {F20%, F40% and SBo}
F20 <- v[1]
F40 <- v[2]
F40.F20 <- F40/F20
So <- v[3]
yymax <- 1.4*max(dta$Ft,F40.F20)

x.mcmc <- dta$SB[33]/v[3]*rlnorm(350,0,0.2)
y.mcmc <- dta$Ft[33]/v[1]*rlnorm(350,0,0.12)
bw = 15
levs = seq(0,1,0.1)
bwx = (max(x.mcmc) - min(x.mcmc))/bw
bwy = (max(y.mcmc) - min(y.mcmc))/bw
est <- bkde2D(cbind(x.mcmc, y.mcmc), bandwidth = c(bwx, bwy), gridsize = c(51,51))

est$fhat = est$fhat/max(est$fhat)
tmp.1 <- expand.grid(x = est$x1, y = est$x2)
tmp.2 <- melt(est$fhat)
tmp.3 <- data.frame(x=tmp.1$x, y=tmp.1$y, z=tmp.2$value)

# ---------------- KOBE - PLOT -------------------------------

kobe <- ggplot(dta) +
  theme_bw() + scale_x_continuous(limits=c(0,1)) +
  scale_y_continuous(limits=c(0,yymax),
                     breaks = round(sort(c(0.5,1.0,F40.F20,1+(F40.F20-1)/2,yymax-(yymax-F40.F20)/2)),digits = 3),
                     labels = c(' 0.5','1.0', paste(round(1+(F40.F20-1)/2,digits=2)),
                                expression(F[20]/F[40]),paste(round(yymax-(yymax-F40.F20)/2,digits=2))))

kobe <- kobe +
  geom_rect(xmin = 0.0, xmax = 1.0, ymin = 0.0, ymax = yymax, fill = 'yellow', alpha = 0.65) +
  geom_rect(xmin = 0.0, xmax = 0.4, ymin = 1.0, ymax = yymax, fill = '#FF0000FF', alpha = 0.35) +
  geom_rect(xmin = 0.4, xmax = 1.0, ymin = 1.0, ymax = 0.0, fill = 'green', alpha = 0.55) +
  geom_rect(xmin = 0.0, xmax = 0.2, ymin = F40.F20, ymax = yymax, fill = 'red', alpha = 0.85) +
  geom_contour(data = tmp.3, aes(x = x, y = y, z = z, colour = ..level..), bins = 9, size = 0.5) +
  scale_colour_gradient(low = 'yellow', high = 'blue') +
  geom_path(aes(x = SB/v[3], y = Ft/v[1]), linetype = 2, size = 0.4) +
  geom_point(aes(x = SB/v[3], y = Ft/v[1], size = yr, fill = yr), shape = 21) +
  scale_size(range=c(0,4)) + labs(y = 'Mortalidad por pesca, relativa a F40%',
                                  x = 'Fracción de la Biomasa Virginal',colour = 'Prob', size = 'Año', fill = 'Año') +
  scale_fill_gradient(limits=c(dta$yr[1], dta$yr[length(dta$yr)]), low="black", high='#0092FFFF') + # colour = yr
  geom_text(data = head(dta,1), aes(x = SB/v[3], y = Ft/v[1]), label = dta$yr[1], colour = 'black', vjust = 2, size = 3) +
  geom_text(data = tail(dta,1), aes(x = SB/v[3], y = Ft/v[1]), label = dta$yr[length(dta$yr)], colour = 'black', vjust = -2, size = 3) +
  geom_text(data = dta, aes(0.1,yymax-(yymax-F40.F20)/2), label = 'Colapso', size = 4, colour = 'white', alpha = 0.2) +
  geom_text(data = dta, aes(0.2,0.5), label = 'Sobrepescado \n BD < 0.4*BDo', size = 3, colour = 'grey50', alpha = 0.2) +
  geom_text(data = dta, aes(0.7,F40.F20), label = 'Sobrepesca \n Ft > F40%', size = 3, colour = 'grey50', alpha = 0.2) +
  geom_text(data = dta, aes(0.7,0.5), label = 'Sin Riesgo', size = 4, colour = 'black', alpha = 0.2)

print(kobe)
ggsave(kobe, file='kobe_plot_esc1.png')