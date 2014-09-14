#
# mkkml.sh, 14 Sep 14

out_cnt=`awk -f cntNA.awk < $1`
echo "$out_cnt"
awk -f mkkml.awk -v outerNA="$out_cnt" < $1 > tt

echo "<?xml version='1.0' encoding='UTF-8'?>"
echo "<kml xmlns='http://www.opengis.net/kml/2.2'>"
echo "	<Document>"
echo "		<Placemark>"
echo "			<styleUrl>#poly-000000-1-76</styleUrl>"
echo "			<Polygon>"
echo "	<innerBoundaryIs> <LinearRing> <coordinates>"

sed -e "s/$/,0/" < tt | \
sed -e "s/\>,0$/\>/"  | \
sed -e "s/NA,NA,0/\<\/coordinates\> \<\/LinearRing\> \<\/innerBoundaryIs\> \<innerBoundaryIs\> \<LinearRing\> \<coordinates\>/"
echo "	</coordinates> </LinearRing> </innerBoundaryIs>"
echo "			</Polygon>"
echo "		</Placemark>"
echo "		<Style id='poly-000000-1-76'>"
echo "			<LineStyle>"
echo "				<color>ff0000ff</color>"
echo "				<width>1</width>"
echo "			</LineStyle>"
echo "			<PolyStyle>"
echo "				<color>4C0000ff</color>"
echo "				<fill>1</fill>"
echo "				<outline>1</outline>"
echo "			</PolyStyle>"
echo "		</Style>"
echo "	</Document>"
echo "</kml>"
