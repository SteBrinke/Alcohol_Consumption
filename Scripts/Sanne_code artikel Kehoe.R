# Kehoe (2012) - choose the most appropriate model for alcohol consumption as an exposure for burden of disease
# Data fitting - check

## normal distribution

normal_NL_women <- rnorm(n = 1505, mean = 7.84, sd = 10.50)
hist(normal_NL_women, breaks = 150)

normal_NL_men <- rnorm(n = 1679, mean = 17.47, sd = 18.78)
hist(normal_NL_men, breaks = 150)

## log-normal distribution
# https://msalganik.wordpress.com/2017/01/21/making-sense-of-the-rlnorm-function-in-r/

#vrouwen
m_NLv <- 7.83
s_NLv <- 12.20
location_v <- log(m_NLv^2 / sqrt(s_NLv^2 + m_NLv^2))
shape_v <- sqrt(log(1+(s_NLv^2 / m_NLv^2)))
print(paste("location_v:", location_v))
print(paste("shape_v:", shape_v))
log_normal_NL_women <- rlnorm(n = 1505, location_v, shape_v)
mean(log_normal_NL_women)
plot(density(log_normal_NL_women[log_normal_NL_women < 100]))
hist(log_normal_NL_women, breaks = 150)

  #makkelijkere manier, maar volgens bovenstaande site niet helemaal correct? WAAROM NIET?
  #data_lognorm = rlnorm(1505, meanlog = 1.44, sdlog = 1.11)
  #hist(data_lognorm, breaks = 150)
  #ggplot() +
  #  aes(x=data_lognorm) +
  #  geom_histogram(fill="magenta1",bins=100)


#mannen
m_NLm <- 19.46
s_NLm <- 33.31
location_m <- log(m_NLm^2 / sqrt(s_NLm^2 + m_NLm^2))
shape_m <- sqrt(log(1+(s_NLm^2 / m_NLm^2)))
print(paste("location_m:", location_m))
print(paste("shape_m:", shape_m))
log_normal_NL_men <- rlnorm(n = 1679, location_m, shape_m)
mean(log_normal_NL_men)
plot(density(log_normal_NL_men[log_normal_NL_men < 100]))
hist(log_normal_NL_men, breaks = 150)


## gamma distribution

#vrouwen
gamma_NL_women <- rgamma(n = 1505, shape = 0.94, scale = 8.33)
hist(gamma_NL_women, breaks = 150)
ggplot() +
  aes(x=gamma_NL_women) +
  geom_histogram(fill="magenta1",bins=100)

#mannen
gamma_NL_men <- rgamma(n = 1676, shape = 1.00, scale = 17.45)
hist(gamma_NL_men, breaks = 150)

## weibull distribution

#vrouwen
weibull_NL_women <- rweibull(n = 1505, shape = 0.91, scale = 7.43)
hist(weibull_NL_women, breaks = 150)

#mannen
weibull_NL_men <- rweibull(n = 1676, shape = 0.98, scale = 17.27)
hist(weibull_NL_men, breaks = 150)
