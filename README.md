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

More Information
-------------------
This workflow can be easiily adapted for the use of landscape architects and urban planners to understand existing users perception of a public space.
**I am still exploring how to display images in geojson markers.**
 
