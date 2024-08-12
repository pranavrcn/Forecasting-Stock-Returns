# Load required libraries
library(fpp2)
library(forecast)
library(fGarch)
library(astsa)
library(tseries)

# Load and transform the data
data <- read.table("coca-cola.txt", header = TRUE)
rt <- ts(log(data$ko + 1), start = c(1961, 1), frequency = 12)

# Plot the log returns
plot.ts(rt, ylab = "Log Return", xlab = "Year")

# Plot ACF of log returns and absolute log returns
par(mfcol=c(1,2))
acf(rt, lag = 24, main = "ACF of Log Returns") 
acf(abs(rt), lag = 24, main = "ACF of Abs Log Returns")

# Perform t-test on log returns
t.test(rt)

# Ljung test for ARCH effects
res <- rt - mean(rt)
Box.test(res^2, lag = 12, type = 'Ljung')

# Plot ACF and PACF of squared residuals
astsa::acf2(res^2)

# Fit ARCH(2) model
result2 <- fGarch::garchFit(~1 + garch(2, 0), data = rt, trace = F)
summary(result2)

# Fit ARCH(4) model
result4 <- fGarch::garchFit(~1 + garch(4, 0), data = rt, trace = F)
summary(result4)

# Fit GARCH(1,1) model with normal distribution
result11 <- fGarch::garchFit(~1 + garch(1, 1), data = rt, trace = F)
summary(result11)

# Fit GARCH(1,1) model with Student t distribution
result11std <- fGarch::garchFit(~1 + garch(1, 1), data = rt, trace = F, cond.dist = "std")
summary(result11std)

# Fit GARCH(1,1) model with skewed Student t distribution
result11sstd <- fGarch::garchFit(~1 + garch(1, 1), data = rt, trace = F, cond.dist = "sstd")
summary(result11sstd)

# Plot volatility of Coca-Cola stock
par(mfcol=c(1,1))
vol.result <- fGarch::volatility(result11)
vol.result <- ts(vol.result, frequency = 12, start = c(1961, 1))
plot(vol.result, xlab = 'year', ylab = 'volatility', type = 'l', main = "Volatility of Coca-Cola Stock")

# Plot log returns with prediction intervals
upper <- 0.01057841 + 2 * vol.result  # 0.01057841 is the mean found earlier
lower <- 0.01057841 - 2 * vol.result
tdx <- c(1:609) / 12 + 1961
plot(tdx, rt, xlab = 'year', ylab = 'series', type = 'l', ylim = c(-0.4, 0.4))
lines(tdx, upper, lty = 2, col = 'red')
lines(tdx, lower, lty = 2, col = 'red')

# Forecast volatility for the next 12 months
(predict(result11, n.ahead = 12)[, 3])^2

# Long-term forecast of volatility
summary(result11)
omega <- 0.0002592
alpha1 <- 0.0987809
beta1 <- 0.8297573
omega / (1 - alpha1 - beta1)
(predict(result11, n.ahead = 200)[, 3][200])^2

# Load and transform Procter & Gamble data
data <- read.table("proctor-gamble.txt", header = TRUE)
rt <- log(data$rtn + 1)

# Plot log returns
rtts <- ts(log(data$rtn + 1), start = c(2001, 9), end = c(2011, 9), frequency = 365)
plot.ts(rtts, ylab = "Log Return", xlab = "Year")

# Plot ACF of log returns
astsa::acf2(rt)

# Fit AR(2) model to log returns
m.eqn <- arima(rt, order = c(2, 0, 0))
m.eqn

# Diagnostic checks for AR(2) model
tsdiag(m.eqn)

# Ljung test and ACF of squared residuals
Box.test(m.eqn$residuals^2, lag = 10, type = "Ljung")
astsa::acf2(m.eqn$residuals^2)

# Fit ARMA(2,0)-GARCH(1,1) model to log returns
result <- fGarch::garchFit(~arma(2, 0) + garch(1, 1), data = rt, trace = F)
summary(result)
