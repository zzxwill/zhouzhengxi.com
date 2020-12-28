for i in 2014 2015 2018 2019 2020
do
        cd $i
	echo "\n  - $i"
        ls | awk '{print "    - ["$1"](/$i/"$1")"}'
        cd ..
done
