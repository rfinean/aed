#
# Map SRTM .hgt file to kml form

f_pref=`basename $1 .hgt`

# gdal_contour -a elevation -snodata -32768 -f kml -fl 0.5 "$f_pref.hgt" "$f_pref.5.kml"
gdal_contour -a elevation -snodata -32768 -f kml -fl 5 "$f_pref.hgt" "$f_pref.5.kml"

