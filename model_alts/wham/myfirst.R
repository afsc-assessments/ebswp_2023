myfirst.R
library(rstan)
library(gridExtra)
rstan_options (auto_write = TRUE)
options (mc.cores = parallel::detectCores ())
set.seed(3) # for reproductibility
theta = 0.30
N = 20
y = rbinom(N, 1, 0.3)
y
stan(model_code='t1.stan',data=list(y=y, N=N), iter=5000)

bern.stan = "
data {
  int<lower=0> N;               // number of trials
  int<lower=0, upper="1"> y[N];   // success on trial n
}
parameters {
  real<lower=0, upper="1"> theta; // chance of success
}
model {
  theta ~ uniform(0, 1);        // prior
  y ~ bernoulli(theta);         // likelihood
}
"

</lower=0,></lower=0,></lower=0>