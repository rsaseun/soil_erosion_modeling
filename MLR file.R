#Data preparation
library(readxl)
GLoc <- read_excel("~/Research 2021/Tropical Geomorphometry Study Group/Paper Two/Gully parameters.xlsx", 
                    sheet = "Sheet1")
View(GLoc)
str(GLoc)
summary(GLoc)
attach(GLoc)

#Graphs (Histograms)
xtabs(~order(GLoc))
names(GLoc)

##Make the independent variable a factor of the gully occurrence 

GLoc$GullyF <- factor(GLoc$Gully)

##Identify the reference level among the independent variable (note: "Fully gully" 
##was used as the reference which was denoted "4")
 
GLoc$out <- relevel(GLoc$GullyF, ref = "4")

#Develop Multinomial Logistics Regression Model

##Activate (install in case you don't have) the needed library
library(nnet)

##write the MLR model
erosionmodel <- multinom(out~Aspect + Br + Cr + Curvature + Dd + ElongIndex + 
                           FlowDirect + Geology + Hillshade + NDVI + Orographic + 
                           Population + Rainfall + Road + Slope + Soil + Temp + 
                           Built_up + Elevation + LULC, data = GLoc)

##View the MLR outcome and save as output

sink("MLR_modelFinal.txt")
summary(erosionmodel)
sink()


#Predict

predict(erosionmodel)
print(predict)

sink("predict.erosionmodelFinal.txt")
predict(erosionmodel)
sink()


##Examine the probability of the prediction

predict(erosionmodel, GLoc, type = "prob")


summary(prob)

#Estimate computational mismatches and errors

##Confusion matrix

sink("confusionMatrixFinal.txt")
cm <- table(predict(erosionmodel), GLoc$GullyF)
sink()

print(cm)
plot(cm)

##2-tailed z test

z <- summary(erosionmodel)$coefficients/summary(erosionmodel)$standard.errors
p <- (1 - pnorm(abs(z), 0, 1)) * 2
p
plot(p)

sink("2-tailed z testFinal.txt")
z <- summary(erosionmodel)$coefficients/summary(erosionmodel)$standard.errors
p <- (1 - pnorm(abs(z), 0, 1)) * 2
p
sink()
