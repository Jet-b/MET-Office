Rainfall = read.csv("WesternNorthAmericaJuly2018-rainfall.csv")

allForcingRainfall = Rainfall$All.forcings.simulations
natForcingRainfall = Rainfall$Natural.forcings.only


lower <- min(allForcingRainfall)
upper <- max(allForcingRainfall)
point <- 3.7


mu <- mean(log(allForcingRainfall))
sigma <- sd(log(allForcingRainfall))


allxRain <- seq(lower, upper, length=100)


allyRain <- dlnorm(allxRain, meanlog = mu, sdlog = sigma)


hist(allForcingRainfall, breaks = 30, probability = TRUE, col = "lightblue", main = "Distribution and Log-Normal Curve", xlab = "Rainfall", xlim = c(lower, upper))

lines(allxRain, allyRain, col = "red", lwd = 2)


########## All Forcing Rain ##########
print("##### All Forcing Rain #####")


allMeanRain = mean(allForcingRainfall)
allSdRain = sd(allForcingRainfall)


allxRain = seq(lower, upper, length=100)
allyRain = dnorm(allxRain, mean = allMeanRain, sd = allSdRain)

lines(allxRain, allyRain, col = "green", lwd = 2)
