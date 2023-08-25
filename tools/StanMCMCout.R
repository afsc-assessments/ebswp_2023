# fit gen gamma to resampled data
srs <- read_csv("data/stanresamp.csv")
install.packages("psych")
library(psych)
corPlot(srs[, 1:40])
dev.off()

pak::pkg_install("GGally" )
library(GGally)
?ggpairs(srs, columns=35:40,aes(size=.15,alpha=.2))
ggpairs(srs, columns=30:40,
  #upper = list(continuous = wrap("density", alpha = 0.5), 
  #combo = "box_no_facet"),
  lower = list(
               continuous = wrap("points", alpha = 0.3, size=.1), 
               continuous = wrap("density", alpha = 0.3), 
               combo = wrap("dot_no_facet", alpha = 0.4, size=.2)
               ),
  title = "BTS data"
)+ ggthemes::theme_few()
pm
##--------------------------
# Compute means and CIs (margs)
# First without cov

srdf <- srs |> pivot_longer(cols=1:40,names_to="Year",values_to="Est") |> 
  group_by(Year) |> summarise(Biomass=mean(Est),sd=sd(Est),CV=sd/Biomass,source="draws") #|> 


library(mvtnorm)
set.seed(123)
n <- 1000  # Number of observations
# Multivariate normal
mycov <- read_table("../runs/dat/cov_2022.dat",col_names = FALSE)
mycov<-as.matrix(mycov)
mu<-srdf |> pull(Biomass)/1000
samples <- as_tibble(rmvnorm(1000, mean = mu, sigma = mycov))
samdf<-samples |> pivot_longer(cols=1:40,names_to="Year",values_to="Est") |> 
  group_by(Year) |> summarise(Biomass=mean(Est),sd=sd(Est),CV=sd/Biomass,source="MVN") #|> 
rbind(samdf,srdf) |>  ggplot(aes(x=Year,y=CV,color=source)) + geom_point(stat='Identity',alpha=.4,size=4) +
  ggthemes::theme_few() + ylim(c(0,NA))

glimpse(mycov)
glimpse(samples)
samples |>  summarise_all(sd)
is.matrix(mycov)
is.matrix(samples)
d<-diag(mycov)
mycov <- matrix(data=0,nrow=40,ncol=40)
matrix()
diag(mycov)<-d
write.table(mycov,"../runs/dat/diag_2022.dat",row.names = FALSE,col.names = FALSE)
#I
#interpretation of results suggest that the diagonal matrix allows more year-year 
#variability that with the covariance matrix. That is, the period from 2013-1017 can't
#jump up  
m
sd


##--------------------------
library(mvtnorm)
library(ggplot2)

# Sample data
n <- 1000  # Number of observations
mu <- c(2, 3)  # Mean values
cov_matrix <- matrix(c(1, 0.8, 0.8, 2), nrow = 2, ncol = 2)  # Covariance matrix

# Generate multivariate normal samples
samples <- rmvnorm(n, mean = mu, sigma = cov_matrix)

# Calculate eigenvalues and eigenvectors
eigen_result <- eigen(cov_matrix)
eigenvalues <- eigen_result$values
eigenvectors <- eigen_result$vectors

# Set confidence level
confidence_level <- 0.95

# Calculate scaling factor for confidence level
scaling_factor <- qchisq(confidence_level, df = 2)

# Calculate lengths of semi-major and semi-minor axes
semi_major_axis <- sqrt(scaling_factor * eigenvalues[1])
semi_minor_axis <- sqrt(scaling_factor * eigenvalues[2])

# Center point of ellipse
center <- mu

# Generate ellipse points
theta <- seq(0, 2 * pi, length.out = 100)
ellipse_points <- matrix(c(semi_major_axis * cos(theta), semi_minor_axis * sin(theta)), nrow = 2)
ellipse_points <- t(t(eigenvectors %*% t(ellipse_points)) + center)

# Plot data points and ellipses
ggplot() +
  geom_point(aes(x = samples[, 1], y = samples[, 2]), color = "blue") +
  geom_polygon(data = as.data.frame(ellipse_points), aes(x = V1, y = V2), color = "red", fill = NA) +
  coord_equal() +
  xlim(min(samples[, 1]) - 1, max(samples[, 1]) + 1) +
  ylim(min(samples[, 2]) - 1, max(samples[, 2]) + 1) +
  xlab("Variable 1") +
  ylab("Variable 2") +
  ggtitle("Confidence Intervals") +
  theme_bw()
