

# Data Wrangling ----------------------------------------------------------

install.packages('dplyr')

library(dplyr)
library(ggplot2)

head(starwars)
data('starwars')

str(starwars)

# Filtrar -----------------------------------------------------------------
starwars %>% 
  filter(species == 'Droid')

subset(starwars, species == 'Droid')

starwars %>% 
  filter(skin_color == 'light', eye_color == 'brown')

starwars %>% 
  filter(skin_color == 'light' & eye_color == 'brown' & hair_color == 'black')

# Arrange -----------------------------------------------------------------

starwars %>% 
  arrange(height, mass)

starwars %>% 
  arrange(desc(height))


# Slice -------------------------------------------------------------------

starwars %>% 
  slice(5:10)

starwars %>% 
slice_head(n = 3) # Primeras filas

starwars %>% 
  slice_tail(n = 5) # Ultimas filas


# Select ------------------------------------------------------------------

starwars %>%
  select(hair_color, eye_color, skin_color)

starwars %>% 
  select(hair_color, skin_color, eye_color) %>% 
  filter(skin_color == 'white')

starwars %>% 
  select(!(hair_color:eye_color)) # Seleccciona todo menos estas; Los : borran las columnas del medio

starwars %>% 
  select(!name & !eye_color) # Así solo se sacan estas en específico

starwars %>% 
  select(1, 2, hair_color, eye_color)

starwars %>% 
  select(-name, -skin_color)


# Select & Contain --------------------------------------------------------

starwars %>% 
  select(starts_with('c'))

# Renombrar ---------------------------------------------------------------

starwars %>% 
  dplyr::rename(Character = name)

# Mutate ------------------------------------------------------------------
new <- starwars %>% 
  mutate(height_m = height / 100) %>% 
  select(height_m, height, everything())

new <- starwars %>% 
  mutate(height_m = height / 100)

# Mutate & ifelse ---------------------------------------------------------

starwars %>% 
  mutate(height_cat = ifelse(height > 100, 'tall', 'small')) %>% # ifelse es un si y solo si 
  select(height, height_cat, everything()) # para organizar

# Mutate & ifesle & ggplot2 -----------------------------------------------

starwars %>% 
  mutate(height_cat = ifelse(height > 100, 'tall', 'small')) %>% 
  ggplot(aes(x=height, fill=height_cat)) +
  geom_histogram() +
  labs(x= 'algo', y='otro')


# Summarise & Mean --------------------------------------------------------

starwars %>% 
  summarise(height_cm = mean(height, na.rm = T))

# Summarise & Mean & Min & Max --------------------------------------------

starwars %>% 
  summarise(mean = mean(height, na.rm = T), 
min= min(height, na.rm = T), 
max= max(height, na.rm = T))

# Agrupar  --------------------------------------------------------
starwars %>% 
  group_by(species) %>% 
  summarise(
    mean_height = mean(height, na.rm = T),
    sd_height = sd(height, na.rm = T))


# Contar ------------------------------------------------------------------

starwars %>% 
  group_by(species) %>% 
  count(homeworld, sort=T) %>% # sort es acomodar por orden de más a menos
  print(n=57)


# Sample-Al azar ----------------------------------------------------------

starwars %>% 
  sample_n(10)
