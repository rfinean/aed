#
# filtkml.awk, 14 Sep 14

BEGIN {
	prev_line=""
	last_was_coord=0
	}

$1 == "<innerBoundaryIs>" {
	last_line=$0
	if (getline <= 0)
	   print "getline failed"
	if (($1 != "</coordinates>") &&
	    ($1 != "<extrude>1</extrude>"))
  	   {
	   print last_line
	   print $0
	   }
	else
	if ($1 == "</coordinates>")
	   print "<innerBoundaryIs> <LinearRing> <coordinates>"
	else
	    print "<extrude>1</extrude>"
	next
	}

$4 == "<innerBoundaryIs>" {
	last_line=$0
	if (getline <= 0)
	   print "getline failed"
	if ($1 != "</coordinates>")
  	   {
	   print last_line
	   print $0
	   }
	else
	   print "</coordinates> </LinearRing> </innerBoundaryIs>"
	next
	}

# comment out
$0 == "</innerBoundaryIs>" {
	if (last_was_coord == 1)
	   {
	   print "</coordinates> </LinearRing> </innerBoundaryIs>"
	   last_was_coord=0
	   }
	else
	   {
	   last_was_coord=1
	   prev_line=$0
	   }
	next
	}

	{
	if (last_was_coord == 1)
	   {
	   print prev_line
	   last_was_coord=0
	   }
	print $0
	next
	}

