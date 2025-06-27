# forecasting_HAL_prices-for-next-30-days.

This project forecasts the **next 30 days of HAL (Hindustan Aeronautics Limited)** stock prices using the **ARIMA time series model** in R. The model is built on historical stock data fetched from **Yahoo Finance**, and visualized using **ggplot2**.

 🔧 Technologies Used

- R Programming
- `quantmod` for data collection.
- `forecast` for ARIMA modeling.
- `ggplot2` for visualization.

## 📥 Data Source

- **Ticker**: `HAL.NS`
- **Source**: [Yahoo Finance](https://finance.yahoo.com/quote/HAL.NS)

- ## 📊 Forecast Methodology

- **Model Used**: `auto.arima()` from the `forecast` package
- **Forecast Horizon**: 30 days ahead
- **Outputs**:
  - Predicted closing prices
  - 95% confidence interval
  - Shaded uncertainty band.
 
  - ## 📉 Sample Output Plot

![Forecast Plot](forecast_plot.png)  
*Red Line = Predicted Price | Grey Ribbon = 95% Confidence Interval*

## 📋 Key Insights

- The forecast expects **a mild upward trend** in HAL’s stock.
- Model uncertainty increases over time, visible through the **expanding ribbon**.
- Suitable for **short-term financial analysis**.

- ## Author
- Anshu Kumar.
