for i in 2020 2019 2018 2015 2014 2012 2011 2010
do
        cd $i
	echo "\n  - $i"
        ls | awk -v year=$i '{print "    - [" $1 "](" year "/" $1 ")"}'
        cd ..
done
