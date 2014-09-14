#
# cntNA.awk, 14 Sep 14

BEGIN {
	cur_max_rows=0
	cur_max_NA=0
	num_NA=0
	num_rows=0
	}

$0 == "NA,NA" {
#	print num_NA "," num_rows
	if (cur_max_rows < num_rows)
	   {
	   cur_max_NA=num_NA
	   cur_max_rows=num_rows
	   }
	num_NA++
	num_rows=0
	next
	}

	{
	num_rows++
	next
	}

END {
#	print cur_max_rows
	print cur_max_NA
	}

