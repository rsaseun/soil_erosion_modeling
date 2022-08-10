#Design boxplot 

library(ggplot2)
install.packages("agricolae")
library(agricolae)
library(dplyr)
library(patchwork)

GClass <- read_excel("~/Research 2021/Tropical Geomorphometry Study Group/Paper Two/Gully parameters.xlsx", 
                     sheet = "Sheet6")

str(GClass)
GClass$GullyClass = as.factor(GClass$GullyClass)

F1 <- ggplot(GClass, aes(x = GullyClass, y = Aspect, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Aspect")
F1

F2 <- ggplot(GClass, aes(x = GullyClass, y = Br, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.shape = NA, width = 0.5, coef=0.5) + labs(x = NULL, y = "Bifurcation ratio")
F2

F3 <- ggplot(GClass, aes(x = GullyClass, y = Cr, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.shape = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Circularity ratio")
F3

F4 <- ggplot(GClass, aes(x = GullyClass, y = Curvature, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.shape = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Curavture")
F4

F5 <- ggplot(GClass, aes(x = GullyClass, y = Dd, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Drainage density")
F5

F6 <- ggplot(GClass, aes(x = GullyClass, y = ElongIndex, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Elongation index")
F6

F7 <- ggplot(GClass, aes(x = GullyClass, y = FlowDirect, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Flow direction")
F7

F8 <- ggplot(GClass, aes(x = GullyClass, y = Geology, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Geology")
F8

F9 <- ggplot(GClass, aes(x = GullyClass, y = Hillshade, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Hillshade")
F9

F10 <- ggplot(GClass, aes(x = GullyClass, y = NDVI, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "NDVI")
F10

F11 <- ggplot(GClass, aes(x = GullyClass, y = Orographic, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Orographic index")
F11

F12 <- ggplot(GClass, aes(x = GullyClass, y = Population, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Population density")
F12

F13 <- ggplot(GClass, aes(x = GullyClass, y = Rainfall, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Rainfall")
F13

F14 <- ggplot(GClass, aes(x = GullyClass, y = Road, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Distance to road")
F14

F15 <- ggplot(GClass, aes(x = GullyClass, y = Slope, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Slope")
F15

F16 <- ggplot(GClass, aes(x = GullyClass, y = Soil, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Soil")
F16

F17 <- ggplot(GClass, aes(x = GullyClass, y = Temp, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Temperature")
F17

F18 <- ggplot(GClass, aes(x = GullyClass, y = Built_up, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "Built_up Areas")
F18

F19 <- ggplot(GClass, aes(x = GullyClass, y = Elevation, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.alpha = NA, width = 0.7, coef=1.5) + 
  labs(x = NULL, y = "Elevation") 
F19

F20 <- ggplot(GClass, aes(x = GullyClass, y = LULC, color = GullyClass, fill = GullyClass)) + 
  geom_boxplot(alpha = .25, show.legend = F, outlier.shape = NA, width = 0.5, coef=0.5) + 
  labs(x = NULL, y = "LULC")
F20



#Placement for graphical analysis

F1 + F2 + F3 + F4 + F5 + F6 + F7 + F8 + F9 + F10 + F11 + F12

F13 + F14 + F15 + F16 + F17 + F18 + F19 + F20 
