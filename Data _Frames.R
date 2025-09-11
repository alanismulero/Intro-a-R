library(datasets)
data("mtcars")
head(mtcars, 20)
View(mtcars)


# To examine 9/9/2025------------------------------------------------------------
class(mtcars)
length(mtcars)
nrow(mtcars)
ncol(mtcars)
attributes(mtcars)
str(mtcars)
summary(mtcars)


# Data manipulation -------------------------------------------------------
four <- 4
class(four)


# Vectores ----------------------------------------------------------------
vector()
x <- c(1, 2, 3)
z <- c("Alanis", "Ariana", "Natalia")
z <- c(z, "luis")
z <- sort(z)
z

# Create your vector ------------------------------------------------------

a <- seq(1:50)
seq(1, 50, by = 2)
seq(from = 2, to = 20, by = 0.2)

a[40]
z[3]

series <- 0:100
series

sample(series, 1)



# Missing Values ----------------------------------------------------------

v <- c(1, 2, NA, 4, 5)
mean(v)
mean(v, na.rm = T)

# Matriz ------------------------------------------------------------------

m <- matrix(1:20, nrow=4, ncol=5)
m

x <- c(1, 2, 3, 4, 5)
y <- c(6, 7, 8, 9, 10)
z <- c(11, 12, 13, 14, 15)

matrix <-  cbind(x, y, z)
matrix

dim(matrix)
cor(matriz)

# Data Frames 11/09/2025-------------------------------------------------------------
df <- data.frame(
  Name = c("Yoda", "R2_D2", "Chewbacca", "Obi-Wan Kenobi", "Luke Skywalker"),
  Age = c(900, 36, 235, 57, 53),
  Weights = c(130, 180, 150, 170, 160)
)
df


# Subsets -----------------------------------------------------------------

df[1,] # first row
df[,2] # second column
df[1:3,2] # primeros tres de la segunda columna

subset_df <- df[df$Age > 250, ]
print(subset_df)


subset(df, Age > 100 & Weights < 200)

df1 <- df[, c("Name", "Age")]
df1

# Agregar una nueva columna al data set -------------------------------------
df$Height <- c(66, 109, 228, 182, 172)
df

df$Jedi <- c(T, F, F, T, T)
df


# Agregar nueva fila ------------------------------------------------------

new_row <- data.frame(Name = "Darth Vader", Age = 45, Weights = 120, Height = 202, Jedi = F)
new_row


df <- rbind(df, new_row)
df

# Nombres -----------------------------------------------------------------

colnames(df) <- c('Characters', 'Age (yrs)', 'Weights (kgs)', 'Height (m)', 'Jedi')
df

str(df)

# Order Data Frame --------------------------------------------------------

df[order(df$Age), ]

df[order(-df$Weights), ]

# Merging Data Frames -----------------------------------------------------

df2 <- data.frame(
  Characters = c("Yoda", 'Luke Skywalker', 'Chewbacca', 'R2_D2', 'Obi-Wan Kenobi', 'Darth Vader'),
  Planets = c('Dagobin', 'Tattoine',' Kashyyyk', 'Naboo', 'Stewjon', 'Tattoine')
)
df2
merged_df <- merge(df, df2, by = 'Characters')
merged_df
