**ps239t-final-project**
=========================

Short Description
---------------------

Scrape Instagram and get geolocatiions of public photos taken around Lake Merritt and URLs and map them to understand what current users are looking at. 


Dependencies
-------------------

* R version 3.2.2
* Python 2.7.10 :: Anaconda 2.3.0 (x86_64)
* Leaflet for R
* Python-instagram
* ggplot for R

**Files**
============

Data
-----------------

lake_merritt.csv: longtitude, latitude of public photos scraped from instagram and URLs to those photos.
Code
---------------
* 01_scrape_instagram.py: Scrapes Instagram to Collects geolocations information and urls of photos taken around lake merritt. Write output to csv. 
* 02_geospatial.R: Maps geolocation of points where photos were taken and display the photos with ggplot and leaflet.

Results
--------------

* lakemerritt-ggplot.pdf: Static map that shows where photos are taken around lake merritt.
* lakemerritt.html: Exported interactive map from Rstudio.
* lakemerritt_photo_heatmap.png: Generated with CartoDB Density Map option to display where most photos are taken.
* lakemerritt_geojson: Geojson file that is hosted on github to display points and urls.
* slides_update.pdf: Presentation slides that document the process.
* updated interactive map created and hosted on CartoDB: https://cz4fy.cartodb.com/viz/ff8d3d1e-a9fe-11e5-ba0c-0ecfd53eb7d3/public_map

More Information
-------------------
**This workflow can be easiily adapted for the use of landscape architects and urban planners to understand existing users perception of a public space.**
My biggest struggle during the process was to configure geojson code so that raster images could be displayed in markers but images failed show up on github. Although they displayed in mapbox studio's open source map editor, there's no easy way to automate displaying images in markers in mapbox editor. 
Finally I'd come to CartoDB and manipulated html code for all markers easily with one line of code  with the help from this post: http://2015.padjo.org/tutorials/mapping/015-adding-nypd-precincts-vector-layer-to-cartodb/
 
