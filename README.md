# Time Series Analysis of Stock Returns

## Overview

This project focuses on the time series analysis of stock returns using advanced econometric models such as ARCH (Autoregressive Conditional Heteroskedasticity) and GARCH (Generalized Autoregressive Conditional Heteroskedasticity) models. The analysis involves two datasets:

1. **Coca-Cola Monthly Stock Returns (1961-2011)**
2. **Proctor & Gamble Daily Stock Returns (2001-2011)**

The goal is to model the volatility of stock returns, assess their statistical properties, and generate forecasts using various ARCH/GARCH models. This project is particularly relevant for roles in data science and data analysis, where time series forecasting and financial econometrics are often applied.

## Key Objectives

### 1. Data Transformation and Visualization
   - **Log Returns Calculation:** Converted simple stock returns to log returns for both datasets.
   - **Time Series Conversion:** Transformed the log returns into time series objects for further analysis.
   - **Visualization:** Created plots of the log returns to visually inspect for volatility clustering and other patterns.

### 2. Statistical Analysis of Log Returns
   - **Serial Correlation:** Tested whether the log returns are serially uncorrelated and independent using ACF (Autocorrelation Function) plots and other visual tools.
   - **Mean Testing:** Evaluated if the mean of the log returns is significantly different from zero using hypothesis testing.

### 3. ARCH and GARCH Model Fitting
   - **ARCH Models:** 
     - Started with an ARCH(2) model to capture volatility clusters in the log returns.
     - Diagnosed and refined the model to improve its fit and performance.
   - **GARCH Models:**
     - Implemented GARCH(1,1) models with various noise distributions (normal, Student t, skewed Student t) to capture both volatility persistence and heavy tails in the returns.
   - **Model Selection:** Used model selection criteria such as AIC (Akaike Information Criterion) and BIC (Bayesian Information Criterion) to select the best-fitting model.

### 4. Volatility Forecasting
   - **Volatility Plots:** Generated plots of the estimated volatility over time to identify periods of high and low market volatility.
   - **Prediction Intervals:** Created prediction intervals for log returns by adding and subtracting twice the estimated volatility from the mean to assess the model's predictive performance.
   - **Long-Term Forecasts:** Provided forecasts for the volatility over the next 12 months and evaluated the long-term behavior of the model as time progresses.

### 5. Model Diagnostics and Validation
   - **Residual Analysis:** Conducted diagnostic checks on the residuals of the fitted models to ensure adequacy and accuracy.
   - **ARCH Effects:** Confirmed the presence of ARCH effects in the log returns using statistical tests on the squared residuals.
   - **Final Model Selection:** Compared multiple ARCH and GARCH models and selected the best-performing model based on diagnostic criteria and forecasting accuracy.

## Technical Skills Demonstrated

- **Time Series Analysis:** Proficient in analyzing and modeling time-dependent data using advanced econometric techniques.
- **Econometric Modeling:** Expertise in fitting and interpreting ARCH/GARCH models to understand volatility dynamics in financial time series.
- **R Programming:** Extensive use of R for statistical computing, including packages like `fGarch`, `forecast`, and base R functions for data manipulation and visualization.
- **Statistical Testing:** Applied hypothesis testing to assess the properties of stock returns and the adequacy of fitted models.
- **Model Diagnostics:** Performed rigorous diagnostic checks to validate model assumptions and ensure robust forecasting.
