# Set up a single plot
par(mfrow = c(1, 1))

# data1 is the data without Human intervention
data1 <- Mediterranean$Natural.forcings.only[!is.na(Mediterranean$Natural.forcings.only)]

# data2 is the data with Human intervention
data2 <- Mediterranean$All.forcings.simulations[!is.na(Mediterranean$All.forcings.simulations)]

plot(density(data1), col = "#129012", main = "Overlayed Smoothed Normalized Densities", xlab = "Temperature difference", ylab = "Probability")

lines(density(data2), col = "#2493c0")

legend("topright", legend = c("Natural", "Human"), fill = c("#129012", "#2493c0"))

xValue <- 3.71

abline(v = xValue, col = "red", lty = 2)

integrand_function1 <- function(x) dnorm(x, mean = mean(data1), sd = sd(data1))
integrand_function2 <- function(x) dnorm(x, mean = mean(data2), sd = sd(data2))

# Integrate from xValue to the maximum value of data2
area1 <- integrate(integrand_function1, lower = xValue, upper = max(data1))$value
area2 <- integrate(integrand_function2, lower = xValue, upper = max(data2))$value

# Print the result

print(area1)
print(area2)
print(area2/area1)