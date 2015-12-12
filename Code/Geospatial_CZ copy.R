################################################
#### PS239T Final Project
#### Chelsea Zhou 
################################################
rm(list = ls())
setwd("/Users/chelseazhou/ps239t-final-project/16_final-projects/final_project")

x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap", 
       "sp", "ggplot2", "scales",  "maps", "classInt", "RColorBrewer")
install.packages(x)                             
lapply(x, library, character.only = TRUE) 
library(ggplot2)
library(maps)
library(ggmap)
geocode("Lake Merritt, CA", source="google")
x <- geocode("Lake Merritt", source="google") #run on command line - but we need different format
lakemerritt_map <-get_map('Lake Merritt',zoom=15)
ggmap(lakemerritt_map)
#### spatialpoints

# data: longitude and latitude of instagram photo geolocations scraped via python
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
library(raster)
r <- raster('Screen Shot 2015-12-08 at 1.21.56 AM.png')
# exploring interactive maps with leaflet package
photo_popup <- paste0("<strong>URL: </strong>", dat$URL)
library(leaflet)
lm <- leaflet(dat) %>%
  setView(lng=-122.258, lat=37.801, zoom = 13) %>%
  addProviderTiles("Stamen.Toner") %>%  # Add beautiful base map made by Stamen
  addMarkers(lng=-122.258, lat=37.801, popup="Lake Merritt - Project Site") %>%
  addCircles(dat, lng = dat$long, lat = dat$lat, radius=40, color='firebrick') %>%
  addMarkers(lng=dat$long[2], lat=dat$lat[2], popup='<img src="https://scontent.cdninstagram.com/hphotos-xpa1/t51.2885-15/e15/924756_412596178887551_2004166462_n.jpg" width="100px">') %>%
  addMarkers(lng=dat$long[3], lat=dat$lat[3], popup='<img src="https://scontent.cdninstagram.com/hphotos-xpa1/t51.2885-15/e15/927738_751654308260433_880924362_n.jpg" width="100px">') %>%
  addMarkers(lng=dat$long[4], lat=dat$lat[4], popup='<img src="https://scontent.cdninstagram.com/hphotos-xpa1/t51.2885-15/e15/924055_1523219964607110_1900805353_n.jpg" width="100px">') %>%
lm


