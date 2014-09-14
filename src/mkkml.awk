#
# mkkml.awk, 14 Sep 14

function start_outer()
{
if (num_NA != 1)
   print "	</coordinates> </LinearRing> </innerBoundaryIs>"
print "<extrude>1</extrude>"
print "<outerBoundaryIs> <LinearRing> <coordinates>"
}

function end_outer()
{
print "</coordinates> </LinearRing> </outerBoundaryIs>"
print "	<innerBoundaryIs> <LinearRing> <coordinates>"
}

BEGIN {
	num_NA=0
	seen_first=0
	}

seen_first == 0 {
	seen_first=1
	next
	}

$0 == "NA,NA" {
	num_NA++
	if (num_NA == outerNA)
	   start_outer()
	else if (num_NA == (outerNA+1))
	   end_outer()
	else
	   print $0
	next
	}

	{
	print $0
	next
	}

