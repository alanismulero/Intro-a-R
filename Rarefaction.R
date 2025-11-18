# Plotting mothur rarefaction data
#  rarefaction.single() output file as used in Schloss SOP
# is file used for input


# read in rarefaction file

data <- read.table(file="toad.opti_mcc.groups.rarefaction", header=T)

name <- read.table(file="rhinmar.files", header=T)

head(data) # take a look to check col and row names

# Now we want to choose just one column per sample as
# at the moment there are 3
# we'll use the ones starting with X0.03

# load dplyr

library(dplyr)

# now we'll use dplyr to make a new dataframe called boo
# containing only columns with the prefix "X0.03"
# if you wanna plot the HCI or LCi ones then
# change starts-with as appropriate.

boo <- select(data, starts_with("X0.03"))

# boo <- select(data, starts_with("hci"))

head(boo) # check all your samples are there.

names(boo) <- substring(names(boo), 7) # mothur adds that awful prefix to sample
# name - use substring to remove where the no
# represents which letter you want name to start on - here it's 7th letter
head(boo) # check you got it right

# now add numsampled row back in as this will be out y axis. 

boo$numsampled<- data$numsampled

head(boo) # check




# and now to plotting
install.packages("reshape2")
install.packages("directlabels")
install.packages("RColorBrewer")
library(ggplot2)
library(reshape2)
library(directlabels)
library(RColorBrewer)


library(tidyr)
library(dplyr)

boo_long <- boo %>%
  pivot_longer(
    cols = -numsampled,
    names_to = "variable",
    values_to = "value"
  )

colnames(boo_long)

# B1 y G1
vars_to_plot <- c("AMRm", "AMRm_1SCR")

boo_two <- boo_long %>% 
  filter(variable %in% vars_to_plot)

r1 <- ggplot(boo_two, aes(x = numsampled, y = value, color = variable)) +
  geom_line(size = 1) +
  theme_bw() + labs(x="Number of Sequences", y = "Number of OTUs") +
  theme(
    axis.text.x  = element_text(size = 12, vjust = 0.5, color = "black"), 
    axis.text.y  = element_text(size = 12, vjust = 0.5, color = "black"),
    axis.title.x = element_text(size = 14, vjust = 0.25, face = "bold", color = "black"),
    axis.title.y = element_text(size = 14, vjust = 1,    face = "bold", color = "black"),
    legend.position = c(0.80, 0.20),       # legend inside plot
    legend.background = element_rect(fill = "white", color = "black"),
    legend.title = element_blank()
  )
r1
  
# B2 y G2

vars_to_plot2 <- c("AMRm_2SCR", "AMRm_2SCR_3")

boo_one <- boo_long %>% 
  filter(variable %in% vars_to_plot2)

r2 <- ggplot(boo_one, aes(x = numsampled, y = value, color = variable)) +
  geom_line(size = 1) +
  theme_bw() + labs(x="Number of Sequences", y = "Number of OTUs") +
  theme(
    axis.text.x  = element_text(size = 12, vjust = 0.5, color = "black"), 
    axis.text.y  = element_text(size = 12, vjust = 0.5, color = "black"),
    axis.title.x = element_text(size = 14, vjust = 0.25, face = "bold", color = "black"),
    axis.title.y = element_text(size = 14, vjust = 1,    face = "bold", color = "black"),
    legend.position = c(0.80, 0.20),       # legend inside plot
    legend.background = element_rect(fill = "white", color = "black"),
    legend.title = element_blank()
  )

r2

# B3 y G3
vars_to_plot3 <- c("AMRm_3SCR", "AMRm_3SCR_5")

boo_three <- boo_long %>% 
  filter(variable %in% vars_to_plot3)

r3 <- ggplot(boo_three, aes(x = numsampled, y = value, color = variable)) +
  geom_line(size = 1) +
  theme_bw() + labs(x="Number of Sequences", y = "Number of OTUs") +
  theme(
    axis.text.x  = element_text(size = 12, vjust = 0.5, color = "black"), 
    axis.text.y  = element_text(size = 12, vjust = 0.5, color = "black"),
    axis.title.x = element_text(size = 14, vjust = 0.25, face = "bold", color = "black"),
    axis.title.y = element_text(size = 14, vjust = 1,    face = "bold", color = "black"),
    legend.position = c(0.80, 0.20),       # legend inside plot
    legend.background = element_rect(fill = "white", color = "black"),
    legend.title = element_blank()
  )

r3

# B4 y G4

vars_to_plot4 <- c("AMRm_4SCR", "AMRm_4SCR_7")

boo_four <- boo_long %>% 
  filter(variable %in% vars_to_plot4)

r4 <- ggplot(boo_four, aes(x = numsampled, y = value, color = variable)) +
  geom_line(size = 1) +
  theme_bw() + labs(x="Number of Sequences", y = "Number of OTUs") +
  theme(
    axis.text.x  = element_text(size = 12, vjust = 0.5, color = "black"), 
    axis.text.y  = element_text(size = 12, vjust = 0.5, color = "black"),
    axis.title.x = element_text(size = 14, vjust = 0.25, face = "bold", color = "black"),
    axis.title.y = element_text(size = 14, vjust = 1,    face = "bold", color = "black"),
    legend.position = c(0.80, 0.20),       # legend inside plot
    legend.background = element_rect(fill = "white", color = "black"),
    legend.title = element_blank()
  )
r4

# B5 y G5
vars_to_plot5 <- c("AMRm_5SCR", "AMRm_5SCR_9")

boo_five <- boo_long %>% 
  filter(variable %in% vars_to_plot5)

r5 <- ggplot(boo_five, aes(x = numsampled, y = value, color = variable)) +
  geom_line(size = 1) +
  theme_bw() + labs(x="Number of Sequences", y = "Number of OTUs") +
  theme(
    axis.text.x  = element_text(size = 12, vjust = 0.5, color = "black"), 
    axis.text.y  = element_text(size = 12, vjust = 0.5, color = "black"),
    axis.title.x = element_text(size = 14, vjust = 0.25, face = "bold", color = "black"),
    axis.title.y = element_text(size = 14, vjust = 1,    face = "bold", color = "black"),
    legend.position = c(0.80, 0.20),       # legend inside plot
    legend.background = element_rect(fill = "white", color = "black"),
    legend.title = element_blank()
  )

r5

r1
r2 <- r1 +  labs(x="Number of Sequences", y = "Number of OTUs") +theme_bw() +
  theme(axis.text.x=element_text(size=12, vjust=0.5, color = "black"), 
        axis.text.y=element_text(size=12, vjust=0.5, color = "black"),
        axis.title.x=element_text(size=14, vjust=0.25, face = "bold", color="black"),
        axis.title.y=element_text(size=14, vjust=1, face = "bold", color="black") +
          theme(
            legend.position = c(0.85, 0.85),   # move legend inside
            legend.background = element_rect(fill = "white", color = "black"),
            legend.title = element_blank()
          )
  



r2






# with labels at the end of the lines: 

r <- ggplot(boo_long, aes(x=numsampled, y=value, 
                     group=variable, colour=variable)) +
  geom_line(linewidth = 0.8) + # define line thickness
  scale_colour_manual(values = colorRampPalette(brewer.pal(8, "Set1"))(90), # choose colour palette from colour brewer
                      guide = 'none') +
  geom_dl(aes(label = variable), 
          method = list(dl.combine("last.points"), colour= "black", cex = 1.2))

r
## add Title and axis labels to plot

r2 <- r1 +  labs(x="Number of Sequences", y = "Number of OTUs") +theme_bw() +
  theme(axis.text.x=element_text(size=12, vjust=0.5, color = "black"), 
        axis.text.y=element_text(size=12, vjust=0.5, color = "black"),
        axis.title.x=element_text(size=14, vjust=0.25, face = "bold", color="black"),
        axis.title.y=element_text(size=14, vjust=1, face = "bold", color="black")
  )

## print r2 to see new plot 
r2

#r3 <- r2 + theme(legend.position="none")
#r3



#======================== another version; from co-ex paper where only had 6 samples ------------------------


# set colours to use in line (i have 6 lines in this eg therefor 6 cols)
lineCol = c("red", "darkgreen", "red", "darkgreen", "red", "darkgreen", "red", "darkgreen", "red", "darkgreen")

# plotting 
r <- ggplot() + 
  geom_line(data=boo_long, aes(x=numsampled, y=value, 
                           group=variable, colour=variable), size = 1.5) +
  scale_colour_manual(values = lineCol, labels = c("Body 1", "Gland 1", "Body 2", "Gland 2", "Body 3", "Gland 3", "Body 4", "Gland 4", "Body 5", "Gland 5")) +
  facet_wrap(. ~ variable,
             ncol=2,
             scales="free") +
  theme(legend.position="none")
# where label = c() is where you put new labels you want in legend
r

## axis labels to plot

r2 <- r +  labs(x="Number of Sequences", y = "Number of OTUs") 
r2
## change background of plot to white with theme_bw() 
## remove legend title as there's no point

r3 <- r2 + theme_bw() +  theme(legend.title=element_blank())

r4 = r3 +   theme(legend.key = element_rect(size = 5),
                  legend.key.size = unit(1.5, 'lines')) 

r3 <- r2 + theme(axis.text.x=element_text(size=14, vjust=0.5, color = "black"), 
        axis.text.y=element_text(size=14, vjust=0.5, color = "black"),
        axis.title.x=element_text(size=16, vjust=0.25, face = "bold", color="black"),
        axis.title.y=element_text(size=16, vjust=1, face = "bold", color="black"),
        legend.text=element_text(size=16, vjust=0.5)
  )

r3

# print save as pdf