
# ggplot ------------------------------------------------------------------
library(ggplot2)
library(dplyr)
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point()

# Global ------------------------------------------------------------------

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() +
  geom_smooth()

# Local -------------------------------------------------------------------

ggplot(data = mpg) + geom_point(aes(x = displ, y = hwy)) +
  geom_smooth(aes(x = displ, y = hwy))

# Datos -------------------------------------------------------------------

tvshows <- read.csv('Clase/tvshows.csv')
head(tvshows)

# Create a ggplot canvas --------------------------------------------------

p <- ggplot(data = tvshows,
            mapping = aes(x=GRP, y=PE)) + geom_point() + geom_smooth(method = lm)
p

summary(lm(PE~GRP, data=tvshows))
