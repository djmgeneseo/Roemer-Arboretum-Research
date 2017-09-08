# David Murphy / Supervised by Gregg Hartvigsen
# Spring 2017: Edited 08/09/17
# Forest Succession in the Roemer Arobretum, Geneseo NY 14454

# Extrapolate the species richness of the Roemer Arboretum (transect data from 1999) by parameterizing 
# the following species-area models: 
# Michaelis-Menten (1913), Gleason (1922), Gitnay (1991), and Lomolino (2000)

## Install the following packages if you haven't already: ##
library(openxlsx)
#install.packages("openxlsx")
library(vegan)
#install.packages("vegan")


#####################
#### ROEMER DATA #### - highlight the code below, up until "SPECIES ACCUMULATION/EXTRAPOLATION" and hit 'ctrl+enter'
##################### - once done, move onto "SPECIES ACCUMULATION/EXTRAPOLATION"

#### RD = Roemer Data, includes total observed species ####
RD = read.xlsx("Roemer.spec.xlsx")

# draw accumulation curve
rd1 <- specaccum(RD)
plot(rd1, main = "Tree/sapling, vascular plant", ylab = "# of species")

rd3 <- specaccum(RD, method = "rarefaction")
plot(rd3, main = "Tree/sapling, vascular plants + rarefaction", ylab = "# of species")

############## VD = Vascular Plant Data #################
VD = read.xlsx("Roemer.vasc.xlsx")

# draw species accumulation for observed vascular plants
vd1 = specaccum(VD)
plot(vd1, main = "Vascular plants", ylab = "# of species")

# draw rarefaction of that accumulation curve
vd3 <- specaccum(VD, method = "rarefaction")
plot(vd3, main = "Vascular plants + rarefaction", ylab = "# of species")

############ TD = Tree and Sapling Data ################
TD = read.xlsx("Roemer.trees.saplings.xlsx")

# draw species accumulation for observed tree/sapling species
td1 = specaccum(TD)
plot(td1, main = "Tree/saplings", ylab = "# of species")

# draw rarefaction of that accumulation curve
td3 = specaccum(TD, method = "rarefaction")
plot(td3, main = "Tree/saplings + rarefaction", ylab = "# of species")

################ SD = Sapling Data #####################
SD = read.xlsx("Roemer.saps.xlsx")
sd1 = specaccum(SD)
plot(sd1, main = "Saplings", ylab = "# of species")

# draw rarefaction of that accumulation curve
sd3 = specaccum(SD, method = "rarefaction")
plot(sd3, main = "Saplings + rarefaction", ylab = "# of species")


################################################ - Choose between td3, vd3, or sd3 below:
################################################    - rd3 = tree, sapling, and vascular plant data
################################################    - td3 = tree and sapling data
#####  SPECIES ACCUMULATION/EXTRAPOLATION  #####    - vd3 = vascular plant data
################################################    - sd3 = sapling data
################################################    
#                                                - determine the subsequent y and x values, based on your chosen dataset
#                                                - Highlight all of the code below 'SPECIES ACCUMULATION/EXTRAPOLATION'
#                                                - press 'ctrl+enter'

#################################################################
###### CHOOSE ONE DATASET ######

# Choose td3, vd3, or sd3 by deleting the '#' before 'plot(...)':

    ## rd3 ##
plot(rd3, ylab = "Species Richness", main = "Predicted Tree/Sapling and Vascular Plant Species Richness: Roemer Arboretum", 
     xlab = "Subplots (25m² each)" , ylim = c(0,175), xlim = c(0,3238)) #ylim = c(0,160), xlim = c(0,3238)

    ## td3 ##
#plot(td3, ylab = "Species Richness", main = "Predicted Tree/Sapling Species Richness: Roemer Arboretum", 
#     xlab = "Subplots (25m² each)" , ylim = c(0,40), xlim = c(0,3238)) #ylim = c(0,160), xlim = c(0,3238)

    ## sd3 ##
#plot(sd3, ylab = "Species Richness", col = 'green', ylim=c(0,20),xlim = c(0,3238), main = "Vascular Plants")

    ## vd3 ##
#plot(vd3, main = "Vascular Plant Species Richness: Roemer Arboretum", ylab = "Species Richness", 
#     col = 'blue', xlim = c(0,3238), ylim = c(0,150), xlab = "Subplots (25m² each)")

###### Now edit the '$richness' and '$sites' variables in the x and y values below, to match td3, sd3, and vd3
y = rd3$richness
x = rd3$sites

###### FOR td3 ONLY; OTHERWISE, POUND-OUT THE BELOW CODE ######
###### FINAL TOUCHES: ON-GRAPH LINES/TEXT ######



### Text: 4% arboretum
#text(0, 30, "Transect data =", cex = .75)
#text(0, 29, "4.3% of", cex = .75)
#text(0, 28, "the arboretum", cex = .75)

### Average
#text(3238, 24.5, "Avg. species richness: 22", pos = 2, offset = 1)

### Gitay
#points(3238, 30.3, pch=19, col = 3)
#text(3238, 30.3, "30", pos = 4)

### Lomolino
#points(3238, 20.65, pch = 19, col = 4)
#text(3238, 20.65, "21", pos = 4)

### Gleason
#points(3238, 22.35, pch = 19, col = 2)
#text(3238, 22.35, "22", pos = 4)

### Michaelis-Menten
#points(3238,15.7, pch = 19, col = 5)
#text(3238,15.7, "16", pos = 4)
######### POUND ABOVE CODE IF NOT USING td3 ################

# Now, scrolling-up, highlight all the code below 'SPECIES ACCUMULATION/EXTRAPOLATION'
#################################################################

## Line marks end of observed data (4.3% of the arboretum)
abline(v=138, lty = 2)

###### DRAW EXTRAPOLATIONS ######

## draw a line that each species accumulation formula will use for extrapolation ##
xtmp <- seq(min(x), max(x+3100), len=500)

## Gleason: log-linear ##
mgle <- nls(y ~ SSgleason(x, k, slope))
lines(xtmp, predict(mgle, newdata=data.frame(x=xtmp)),
      lwd=2, col=2)

## Gitay: quadratic of log-linear ##
mgit <- nls(y ~ SSgitay(x, k, slope))
lines(xtmp, predict(mgit, newdata=data.frame(x=xtmp)), 
      lwd=2, col = 3)

## Lomolino: using original names of the parameters (Lomolino 2000): ##
mlom <- nls(y ~ SSlomolino(x, Smax, A50, Hill))
lines(xtmp, predict(mlom, newdata=data.frame(x=xtmp)), 
      lwd=2, col = 4)

## Michealis-Menten: ##
mmic <- nls(y ~ SSmicmen(x, slope, Asym))
lines(xtmp, predict(mmic, newdata = data.frame(x=xtmp)),
      lwd =2, col = 5)

###### LEGEND ######

## Legend for Gitay, Lomolino, and Gleason ##
legend("bottomright", c("Gitay", "Lomolino", "Gleason", "Michaelis-Menten"), col = c(3, 4, 2,5), lwd = c(2,2,2,2), lty=c(1,1,1,1))

###### CONFIDENCE INTERVALS ######

## Gleason: confidence limits from profile likelihood
confint(mgle)
## Gitay: confidence limits from profile likelihood
confint(mgit)
## Lomolino: confidence limits from profile likelihood
confint(mlom)
## Michaelis-Menten: confidence limits from profile likelihood
confint(mmic)

###### EVALUATE MODEL EFFICIENCY (AIC - Akaike Information Criterion) ######

allmods <- list(Gleason = mgle, Gitay = mgit, Lomolino = mlom, Mic.Menten = mmic)
sapply(allmods, AIC)