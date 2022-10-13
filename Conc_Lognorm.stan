data {
  int<lower=1> N; // sample size
  vector<lower=0>[N] Y_L; // lower bound
  vector<lower=0>[N] Y_U; // upper bound
  real gsd_int; // preinformation for GSD
  int<lower=1> N_new;
}

transformed data {
  real<lower=0> mean_MB;

  mean_MB = (mean(Y_L) + mean(Y_U))/2;
}

parameters {
  real<lower=0> gm; // geometric mean
  real<lower=1> gsd; // geometric sd
}

transformed parameters {
  real<lower=0> theo_mean;
  // theoritical mean
  theo_mean = exp(log(gm) + 0.5*(log(gsd))^2);
}

model {
  // prior distribution
  target += cauchy_lpdf(gsd | gsd_int, gsd_int);
  target += normal_lpdf(theo_mean | mean_MB, mean_MB);
  // model
  for (i in 1:N) {
    if (Y_L[i]==Y_U[i]) {
      target += lognormal_lpdf(Y_U[i] | log(gm), log(gsd));
    } else {
      if (Y_L[i]==0) {
        target += lognormal_lcdf(Y_U[i] | log(gm), log(gsd));
      } else {
        target += log( lognormal_cdf(Y_U[i], log(gm), log(gsd)) - lognormal_cdf(Y_L[i], log(gm), log(gsd)) );
      }
    }
  }
}

generated quantities {
  real<lower=0> theo_sd;
  real log_lik[N];
  real<lower=0> Y_new[N_new];
  // theoritical SD
  theo_sd = sqrt( exp( 2*log(gm)+log(gsd)^2)*(exp(log(gsd^2))-1) );
  // log likelihood
  for (i in 1:N) {
    if (Y_L[i]==Y_U[i]) {
      log_lik[i] = lognormal_lpdf(Y_U[i] | log(gm), log(gsd));
    } else {
      if (Y_L[i]==0) {
        log_lik[i] = lognormal_lcdf(Y_U[i] | log(gm), log(gsd));
      } else {
        log_lik[i] = log( lognormal_cdf( Y_U[i], log(gm), log(gsd) ) - lognormal_cdf( Y_L[i], log(gm), log(gsd) ) );
      }
    }
  }
  for (i in 1:N_new) Y_new[i] = lognormal_rng(log(gm), log(gsd));
}
