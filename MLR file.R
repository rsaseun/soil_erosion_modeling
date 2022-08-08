#Data preparation
GLock <- read_excel("~/Research 2021/Tropical Geomorphometry Study Group/Paper Two/Gully parameters.xlsx", 
                    sheet = "Sheet1")
View(GLock)
str(GLock)
summary(GLock)
attach(GLock)

#Graphs (Histograms)
xtabs(~order(GLock))
names(GLock)

##Make the independent variable a factor

GLock$GullyF <- factor(GLock$Gully)

##Identify the reference level among the independent variable (note: "No gully" 
##was used as the reference which was denoted "0")
 
GLock$out <- relevel(GLock$GullyF, ref = "0")

#Develop Multinomial Logistics Regression Model

##Activate (install in case you don't have) the needed library
library(nnet)

##write the MLR model
erosionmodel <- multinom(out~Aspect + Br + Cr + Curvature + Dd + ElongIndex + 
                           FlowDirect + Geology + Hillshade + NDVI + Orographic + 
                           Population + Rainfall + Road + Slope + Soil + Temp + 
                           Built_up + Elevation + LULC, data = GLock)

##View the MLR outcome and save as output

sink("MLR_model.txt")
summary(erosionmodel)
sink()


#Predict

predict(erosionmodel)
print(predict)

##Examine the probability of the prediction

predict(erosionmodel, GLock, type = "prob")
summary(prob)

#Estimate computational mismatches and errors

##Confusion matrix
cm <- table(predict(erosionmodel), GLock$GullyF)
print(cm)
plot(cm)

##2-tailed z test

z <- summary(erosionmodel)$coefficients/summary(erosionmodel)$standard.errors
p <- (1 - pnorm(abs(z), 0, 1)) * 2
p
plot(p)

