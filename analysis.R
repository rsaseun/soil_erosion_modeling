#Set working folder

setwd("C:/data/R data/Correlation analysis for soil erosion modeling")


#Create packages libraries

library(readxl)
library(ggplot2)
library(tidyverse)
library(GGally)
library(corrplot)
library(corrgram)
library(PerformanceAnalytics)

#Import data from excel worksheet and save as 'data'

data <- read_excel("Variables.xlsx")

View(data)

#Compute correlation coefficient for multicolinearity purpose

#Option 1:

ggcorr(data, label = TRUE)

#Option 2:

ggpairs(data, aes(color = T))

#Option 3:

corrplot(corr = cor(data),
         method = "pie",
         type = "lower",
         tl.pos = "ld",
         order = "original")


corrplot(cor(data),
         addCoef.col = "black",
         number.cex = 0.6,
         number.digits = 2,
         diag = FALSE,
         bg = "light grey",
         outline = "black",
         addgrid.col = "white")


corrplot(corr = cor(data),
        method = "circle",
        addrect = 6,
        rect.col = "green",
        type = "full",
        tl.pos = "tl",
        order = "AOE")
         
#Option 4:

chart.Correlation(data, histogram = TRUE, pch = 100)

#Select option based on the suitability to indicate degree of colinearity 
                 
