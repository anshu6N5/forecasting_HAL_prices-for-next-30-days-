install.packages("MASS")
# loading of necessary libraries 
library(tidyverse)
library(readr)
library(janitor)
library(ggplot2)
library(WDI)
library(nlme)
library(lmerTest)
library(performance)
library(quantmod)
library(forecast)

# Predicting The price of Hindustan Aeronautics Limited (HAL.NS)

#Get the price data from Yahoo Finance 
data <- getSymbols("HAL.NS", src = "yahoo", from = 2025-06-27)
view(data)

#closing prices of HAL
prices <- Cl(HAL.NS)


#converting in the prices into the time series 
ts_prices <- ts(prices)
#model 
model <- auto.arima(ts_prices)
summary(model)

#forecast the prices 
future <- forecast(model, h = 30)


#create a data frame 
last_day <- tail(index(prices),1)
future_df30 <- data.frame(
  date = seq(from = last_day + 4, by = "days", length.out = 30),
  mean = as.numeric(future$mean),
  lower = as.numeric(future$lower[,2]),
  upper = as.numeric(future$upper[,2])
  
)

#graphical representation 
ggplot(future_df30, aes(x = date)) + 
  geom_ribbon(aes(ymin = lower, ymax = upper), color ="darkgrey", alpha = 0.6) + 
  geom_line(aes(y = mean), color = "red", size = 1.2) + 
  labs(
    title = "The Forecasted Price of HAL(for next 30 days)",
    x = "Date",
    y = "Price(INR)"
  ) + 
  theme_minimal()
