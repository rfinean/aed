#
# hgt2csv.sh, 14 Sep 14

basedir="eurasia"

for f in $basedir/*.zip
   do
   unzip -q "$f"
   fcsv=`basename $f .zip`
#   echo "rd.srtm $fcsv > csv_$basedir/${fcsv}.csv"
   echo "$fcsv"
   ./rd.srtm "$fcsv" > "csv_$basedir/${fcsv}.csv"

   if [ "$?" -ne "0" ]
      then
      echo "Not using: csv_$basedir/${fcsv}.csv"
      rm "csv_$basedir/${fcsv}.csv"
      fi
   rm "$fcsv"
   done

