# Set up a single plot
par(mfrow = c(1, 1))

# Remove missing values from the first dataset
data1 <- Mediterranean$Natural.forcings.only[!is.na(Mediterranean$Natural.forcings.only)]

# Remove missing values from the second dataset
data2 <- Mediterranean$All.forcings.simulations[!is.na(Mediterranean$All.forcings.simulations)]

# Plot the first smoothed normalized density line
plot(density(data1), col = "lightgreen", main = "Overlayed Smoothed Normalized Densities", xlab = "Temperature difference", ylab = "Probability")

# Overlay the second smoothed normalized density line on the same axes
lines(density(data2), col = "skyblue")

# Add a legend if needed
legend("topright", legend = c("Natural", "Human"), fill = c("lightgreen", "skyblue"))

xValue <- 0

abline(v = xValue, col = "red", lty = 2)

area1 <- integrate(function(data2) pnorm(data2, mean = mean(data2), sd = sd(data2)), xValue, max(data2))$value


print(area1) 