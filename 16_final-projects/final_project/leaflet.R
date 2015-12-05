# leaflet example
install.packages("leaflet")
library(leaflet)

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=dat$long[1], lat=dat$lat[1], popup='<img src="https://scontent.cdninstagram.com/hphotos-xpa1/t51.2885-15/e15/927738_751654308260433_880924362_n.jpg" width="100px">')
m  # Print the map