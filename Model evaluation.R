#Model evaluation using AIC, AICc

library(MuMIn)

data(GCloc)
View(GLoc)
names(GLoc)

## The global model set up

options(na.action = "na.fail")
??MuMIn::dredge

ols = stats::lm(formula = Gully~Aspect+Br+Cr+Curvature+Dd+ElongIndex+ 
                  FlowDirect+Geology+Hillshade+NDVI+Orographic+Population+
                  Rainfall+Road+Slope+Soil+Temp+Built_up+Elevation+
                  LULC, data = GLoc)

sink("OLS.Coefficients.txt")
summary(ols)
sink()

sink("GlobalModelTest.txt")

MuMIn::dredge(global.model = ols)

sink()

