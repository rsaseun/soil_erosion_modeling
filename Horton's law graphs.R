##Graphs to validate Horton's laws of drainage basin

library(readxl)
library(ggplot2)
library(ggpmisc)

data1 <- read_excel("~/Research 2021/Tropical Geomorphometry Study Group/Paper Two/Horton graphs.xlsx", 
              sheet = "Stream number")

View(data1)

data("data1")

names(data1)

# assembling a single label with equation and R2

my.formula = y ~ poly(x,1)

G1 <- ggplot(data = data1, aes(x = Stream_order, y = Stream_number)) + geom_point() +
  geom_smooth(formula = my.formula, method = "lm", se = T, level = 0.5) + 
  stat_poly_eq(formula = my.formula, aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
               parse = T, size = 3.5, colour = "blue") + 
  labs(x = "Stream Order", y = "Stream Number (Log)")


data2 <- read_excel("~/Research 2021/Tropical Geomorphometry Study Group/Paper Two/Horton graphs.xlsx", 
                    sheet = "Length")



my.formula = y ~ poly(x,1)

G2 <- ggplot(data = data2, aes(x = Stream_order, y = Stream_length)) + geom_point() +
  geom_smooth(formula = my.formula, method = "lm", se = T, level = 0.5) + 
  stat_poly_eq(formula = my.formula, aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
               parse = T, size = 3.5, colour = "blue") + 
  labs(x = "Stream Order", y = "Stream Length (Log)")

G2                              


data3 <- read_excel("~/Research 2021/Tropical Geomorphometry Study Group/Paper Two/Horton graphs.xlsx", 
              sheet = "LengthRatio")


G3 <- ggplot(data = data3, aes(x = Stream_order, y = Length_ratio)) + geom_point() +
  geom_smooth(formula = my.formula, method = "lm", se = T, level = 0.5) + 
  stat_poly_eq(formula = my.formula, aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
               parse = T, size = 3.5, colour = "blue") + 
  labs(x = "Stream Order", y = "Length Ratio")



G1 + G2 + G3
