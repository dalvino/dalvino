## Import libraries
library(tidyverse)
library(ggpubr)
library(rstatix)
library(Hmisc)
library(data.table)
library(fitdistrplus)

## Import data
#setwd("C:\\Users\\dcolbert\\OneDrive - Western Governors University\\MSDADS\\D599 - Data Prep and Exploration\\task 2")
getwd()
df <- read.csv("C:\\Users\\dalvi\\OneDrive - Western Governors University\\MSDADS\\D599 - Data Prep and Exploration\\task 2\\HealthInsuranceSet.csv")

## Transform to data frame
df <- setDT(df)

## Get summary statistics of variables
summary(df)


## Encode Categorical Variables
df$sex <- factor(df$sex, level = c("male", "female"), labels = c(0, 1))
df$sex <- as.numeric(as.character(df$sex))
df$smoker <- factor(df$smoker, level = c("yes", "no"), labels = c(1, 0))
df$smoker <- as.numeric(as.character(df$smoker))
df$region <- factor(df$region, level = c("northeast", "northwest", "southeast",
                                         "southwest"), labels = c(1, 2, 3, 4))
df$region <- as.numeric(as.character(df$region))

df$Level <- factor(df$Level, level = c("A", "B", "C", "D", "E"), labels =
                     c(1, 2, 3, 4, 5))
df$Level <- as.numeric(as.character(df$Level))


# Isolate Variables
age <- df$age
sex <- df$sex
children <- df$children
smoker <- df$smoker
region <- df$region
bmi <- df$bmi
charges <- df$charges
level <- df$Level
score <- df$score


### Part I: Univariate and Bivariate Statistical Analysis and Visualization  
##Univariate Distribution Analysis
# BMI
descdist(bmi, discrete = FALSE)
hist(bmi, main="BMI", xlab= "BMI in kg/m^2", xlim=c(10,60), col="lightblue", freq=TRUE)

# Scores
descdist(score, discrete = TRUE)
hist(score, main="Scores", xlab= "Scores", xlim=c(0, 100), col="lightblue", freq=TRUE)

# Level
descdist(level, discrete = TRUE)
hist(level, main="Level Histogram", xlab= "Level", xlim=c(1, 5), col="lightblue", freq=TRUE)

# Region 
descdist(region, discrete = TRUE)
hist(region, main="Region ", xlab= "Region", xlim=c(1, 4), col="lightblue", freq=TRUE)

## Bivariate analysis
# BMI vs Charges
cor(bmi, charges)
bmi.charges.model <- lm(charges ~ bmi, data = df)
summary(bmi.charges.model)
plot(bmi, charges)
abline(bmi.charges.model)

# Complete Correlation Table
cor(df)

# Sex vs Smoker
chisq.test(sex, smoker)
plot(sex, smoker)


### Part II: Parametric Statistical Testing
# One-way ANOVA test: bmi vs region
one.way <- aov(bmi ~ region, data = df)
summary(one.way)


### Part III: Nonparametric Statistical Testing
# Kruskal-Wallis test: score vs level
kruskal.test(score ~ Level, data = df)





