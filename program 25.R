# 1. Setup Data: 60 minutes of simulated sensor readings
set.seed(123) # For reproducibility
time <- 1:60
temperature <- runif(60, 20, 35)  # Range: 20°C to 35°C
humidity <- runif(60, 30, 60)     # Range: 30% to 60%
pressure <- runif(60, 1000, 1020) # Range: 1000 to 1020 hPa

# 2. Calculate average readings
avg_temp <- mean(temperature)
avg_hum <- mean(humidity)
avg_press <- mean(pressure)

cat("Average Sensor Readings:\n")
cat("Temperature:", round(avg_temp, 2), "°C\n")
cat("Humidity:", round(avg_hum, 2), "%\n")
cat("Pressure:", round(avg_press, 2), "hPa\n\n")

# 3. Identify intervals: Temp > 30 and Humidity < 40
intervals <- which(temperature > 30 & humidity < 40)

cat("Time intervals (minutes) with Temp > 30°C and Humidity < 40%:\n")
if(length(intervals) > 0) {
  print(intervals)
} else {
  cat("None found.\n")
}

# 4. Plot the sensor readings
# Set up a 3-row plotting area
par(mfrow = c(3, 1), mar = c(4, 4, 2, 1))

plot(time, temperature, type = "l", col = "red", 
     main = "Temperature over Time", ylab = "Temp (°C)", xlab = "Minutes")
abline(h = 30, col = "darkred", lty = 2) # Threshold line

plot(time, humidity, type = "l", col = "blue", 
     main = "Humidity over Time", ylab = "Humidity (%)", xlab = "Minutes")
abline(h = 40, col = "darkblue", lty = 2) # Threshold line

plot(time, pressure, type = "l", col = "green", 
     main = "Pressure over Time", ylab = "Pressure (hPa)", xlab = "Minutes")

"Parizaa 23BCE0760"
