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
  col = 'lightblue',
  border = 'gray30', 
  main = 'Mean DNase I Activity by Concentration',
  xlab = 'Concentration (mg/mL)',
  ylab = 'Mean Optical Density',
  las = 2,
  cex.names = 0.8,
  horiz = T
)
