install.packages("car")
library(car)
library(ggplot2)
library(dplyr)
tyre <- read.csv('R Tutorials/tyre.csv')
head(tyre)


# Cambiar colores manual --------------------------------------------------

color <- c("blue", "turquoise", "purple", "lightblue")
color
# Box plot core ----------------------------------------------------------------

ggplot(tyre, 
       aes(x=Brands, y=Mileage)) + geom_boxplot(aes(), fill=color)


# Aesthetic ---------------------------------------------------------------
p <- ggplot(tyre, 
       aes(x=Brands, y=Mileage)) + 
  geom_boxplot(aes(fill=Brands)) + 
  # Labels
  labs(title="Gomas en Puerto Rico", x="Gomas", y="km", fill= "Tire Brands") +
  # theme_minimal()
  # theme_bw()
  theme_classic() +
  # Themes axis
  theme(plot.title=element_text(size=18, face="bold", hjust=0.3)) +
  theme(axis.title.y= element_text(size=18, face="plain", color="black"), 
        # cambia los números de la escala
        axis.text.y= element_text(size=12, face="plain", color="black")) +
  theme(axis.title.x= element_text(size=18, face="plain", color="black"),
        axis.text.x= element_text(size=12, face="plain", color="black")) +
  # theme legend
  theme(legend.title=element_text(size=14, color="black"), legend.text=element_text(size=14)) +
  theme(legend.position="none") +
  ylim(20,40)
 

# Anova -------------------------------------------------------------------
# Mileage variable de respuesta
# Brands variable de respuesta
mod <- aov(Mileage ~ Brands, data=tyre, equal.variance=T) 
summary(mod)

resid_anova <-   resid(mod)

shapiro.test(resid_anova)

leveneTest(Mileage ~ Brands, data=tyre)

TukeyHSD(mod)  

# Guardar plot ----------------------------------------------------------------

p
ggsave(filename="plot1.png",
       plot=p, 
       width=8, height=6, dpi=300)
