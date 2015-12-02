################################################
#### PS239T Final Project
#### Chelsea Zhou 
################################################
setwd("/Users/chelseazhou/Desktop/PS239T/Final Project")

x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap", 
       "sp", "ggplot2", "scales",  "maps", "classInt", "RColorBrewer")
install.packages(x)                             # remember, you only install a package once!
lapply(x, library, character.only = TRUE) 
library(ggplot2)
library(maps)
library(ggmap)
geocode("Lake Merritt, CA", source="google")
x <- geocode("Lake Merritt", source="google") #run on command line - but we need different format
lakemerritt_map <-get_map('Lake Merritt',zoom=15)
ggmap(lakemerritt_map)
#### spatialpoints

# data: cafes where I go often. let's not argue about my personal preferences.
dat <- read.csv("lake_merritt.csv")
head(dat)
class(dat)

# take out coordinates (long, lat) and use instaID as row names
dat_coords <- cbind(dat$long, dat$lat)
row.names(dat_coords) <- dat$instaID
str(dat_coords)

# create a spatialpoints object
dat_sp <- SpatialPoints(dat_coords, 
                        proj4string=CRS("+proj=longlat + ellps=WGS84"))
class(dat_sp)
str(dat_sp) 
summary(dat_sp)

slot(dat_sp, "coords")
bbox(dat_sp)
proj4string(dat_sp)

# basic plot with dots
plot(dat_sp, col="magenta", pch=20)
# now plot the cities in the bay area
ggmap(lakemerritt_map) +
  geom_point(aes(x = long, y = lat, size = 4, colour = I(instaID)), 
             data = dat, alpha = .9) 

