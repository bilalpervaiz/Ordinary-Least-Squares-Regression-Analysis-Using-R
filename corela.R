# Loading Libraries
library(sf)
library(ggplot2)
library(dplyr)
#Load London Data save in Ward variable
wards <- sf::st_read("LondonWards.shp")

#visualizing Ward data 
ggplot(data = wards) +
  geom_sf(aes(fill = AGc_2)) +
  scale_fill_viridis_c(direction = -1) +
  labs(fill='Average GCSE')

#Ploting values of Median Age 2013 and Average GCSE
ggplot(data = wards, aes(x = MdA_2013, y = AGc_2)) +
  geom_point() +
  xlab("Median Age - 2013") +
  ylab("Average GCSE - 2014") +
  theme_minimal()

#Apply Linear Regression Method to see correlation between two parameters
ggplot(data = wards, aes(x = MdA_2013, y = AGc_2)) +
  geom_point() +xlab("Median Age - 2013") +
  ylab("Average GCSE - 2014") +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=FALSE) +
  theme_minimal()

# Summary of the model
model <- lm(AGc_2 ~ MdA_2013, data=wards)
summary(model)

res.df <- data.frame(res = model1$residuals)

#Inspecting Residual 
ggplot(data = res.df, aes(x = res)) +
  geom_histogram() +xlab("Residual") +
  ylab("Count") +
  theme_minimal()

