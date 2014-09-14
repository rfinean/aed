#
# filtkml.awk, 14 Sep 14

BEGIN {
	prev_line=""
	last_was_coord=0
	}

$1 == "</coordinates>" {
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

