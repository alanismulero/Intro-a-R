
# ggplot ------------------------------------------------------------------
library(ggplot2)
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point()



# Global ------------------------------------------------------------------

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() +
  geom_smooth()

# Local -------------------------------------------------------------------

ggplot(data = mpg) + geom_point(aes(x = displ, y = hwy)) +
  geom_smooth(aes(x = displ, y = hwy))
