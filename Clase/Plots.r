data(DNase)
head(DNase)
?barplot

mean_density <- aggregate(density ~ conc, data = DNase, FUN = mean)
mean_density

barplot(
  height = mean_density$density,
  names.arg = mean_density$conc,
  col = 'lightblue',
  border = 'gray30', 
  main = 'Mean DNase I Activity by Concentration',
  xlab = 'Concentration (mg/mL)',
  ylab = 'Mean Optical Density',
  las = 2,
  cex.names = 0.8
)

barplot(
  height = mean_density$density,
  names.arg = mean_density$conc,
  col = 'blue',
  border = 'gray30', 
  main = 'Mean DNase I Activity by Concentration',
  xlab = 'Concentration (mg/mL)',
  ylab = 'Mean Optical Density',
  las = 2,
  cex.names = 0.8,
  horiz = T
)



# Datos Excel -------------------------------------------------------------
library(readxl)

coronary <- read_excel('Clase/coronary.xlsx')
head(coronary)


# Scatter Plot ------------------------------------------------------------

plot(
  coronary$dbp ~ coronary$chol,
  type = "p", # line plot
  col = "blue", # line color
  lwd = 2, # line width del círculo
  xlab = "Total Cholesterol (mmol/L)", # x-axis label
  ylab = "Diastolic Blood Pressure (mmHg)", # y-axis label
  main = "Relationship between Cholesterol and Diastolic BP",
  pch = 15 # cambia la fígura
)

# Spearman Correlation ----------------------------------------------------

spearman_result <- cor.test(
  coronary$chol,
  coronary$dbp,
  method = "spearman",
  exact = FALSE # avoids warnings with tied ranks
)
spearman_result


# Normality Test ----------------------------------------------------------

shapiro.test(coronary$chol)
shapiro.test(coronary$dbp)

# Visualization -----------------------------------------------------------

plot(
  coronary$dbp ~ coronary$chol,
  type = "p", # line plot
  col = "blue", # line color
  lwd = 2, # line width
  xlab = "Total Cholesterol (mmol/L)", # x-axis label
  ylab = "Diastolic Blood Pressure (mmHg)", # y-axis label
  main = "Relationship between Cholesterol and Diastolic BP"
)
abline(lm(dbp ~ chol, data = coronary), col = "red", lwd = 2,lty = 1)

# Line Charts -------------------------------------------------------------

# Asegúrate de que los datos estén ordenados por edad
coronary <- coronary[order(coronary$age), ]
# Gráfico de líneas básico
plot(coronary$age, coronary$chol,
     type = "l", # "l" = line plot
     col = "blue",
     lwd = 2,
     xlab = "Age (years)",
     ylab = "Cholesterol (mmol/L)",
     main = "Cholesterol vs Age")

# Histograms --------------------------------------------------------------

hist(coronary$chol,
     main = "Distribution of Cholesterol",
     xlab = "Cholesterol (mmol/L)",
     col = "lightblue",
     border = "white",
     # breaks = 10, # You can cange the number
)

hist(coronary$dbp,
     col = )

# Box Plots ---------------------------------------------------------------

boxplot(coronary$chol,
        main = "Cholesterol Levels",
        ylab = "Cholesterol (mmol/L)",
        col = "lightgreen",
        border = "darkgreen"
)

boxplot(sbp ~ gender,
        data = coronary,
        main = "Systolic Blood Pressure by Age Group",
        xlab = "Age Group (years)",
        ylab = "Systolic BP (mmHg)",
        col = "lightblue",
        border = "darkblue"
)

# Anova -------------------------------------------------------------------

anova_model <- aov(sbp ~ gender, data = coronary) # sbp variable de respuesta; gender var 
summary(anova_model)

# Normality test ----------------------------------------------------------

shapiro.test(residuals(anova_model))

# Homogeneity of variance -------------------------------------------------

bartlett.test(sbp ~ gender, data = coronary)
