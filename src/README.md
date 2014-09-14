Scripts for converting hgt files to kml files

The workflow is:

rd.srtm.c: convert hgt files to csv
hgt2csv.sh: script for driving the hgt conversion

srtm.R: extract one height contour from csv data

mkkml.sh: script for converting contour data to kml file

cntNA.awk
mkkml.awk: Main work horse
filtkml.awk: fix up issues in mkkml output


http://dds.cr.usgs.gov/srtm/version2_1/SRTM3/

applic-euro-files: List of Eurasia hgt files having at least 15 points below 3 meters

