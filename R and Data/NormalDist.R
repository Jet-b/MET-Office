print("---------- Running ----------")

Mediterranean = read.csv("MediterraneanJune2019.csv")

lower = -5
upper = 5
point = 3.7



########## All Forcing ##########
print("##### All Forcing #####")

allForcing = Mediterranean$All.forcings.simulations

allMean = mean(allForcing)
allSd = sd(allForcing)

#hist(allForcing,  probability = TRUE, col = "red", main = "Distribution and Normal Curve")

allx = seq(lower, upper, length=100)
ally = dnorm(allx, mean = allMean, sd = allSd)

plot.new()
lines(allx, ally, col = "red", lwd = 2)



########## Natural Forcing ##########
print("##### Natural Forcing #####")


natForcing = na.omit(Mediterranean$Natural.forcings.only)

natMean = mean(natForcing)
natSd = sd(natForcing)

#hist(natForcing,  probability = TRUE, col = "green", main = "Distribution and Normal Curve")

natx = seq(lower, upper, length=100)
naty = dnorm(natx, mean = natMean, sd = natSd)

lines(natx, naty, col = "green", lwd = 2)



##### Plotting the lines #####

plot(1, type = "n", xlim = c(-5,5), ylim = c(0,0.4), xlab = "Temperature", ylab = "Probability", main = "Mediteranean Temperature Normal Distribution Curve")

lines(allx, ally, col = "red", lwd = 2)
lines(natx, naty, col = "green", lwd = 2)
abline(v = point, col = "blue", lwd = 2)

natArea = integrate(function(natx) dnorm(natx, mean = natMean, sd = natSd), lower = point, upper = Inf)$value[1]
allArea = integrate(function(allx) dnorm(allx, mean = allMean, sd = allSd), lower = point, upper = Inf)$value[1]

print(natArea)
print(allArea)

print(allArea/natArea)

print("---------- Done ----------")