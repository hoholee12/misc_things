
error(){
	message=$@
	if [ "$(echo $message | grep \")" ]; then
		echo -n $message | sed 's/".*//'
		errmsg=$(echo $message | cut -d'"' -f2)
		echo -e "\x1b[1;31m\"$errmsg\"\x1b[0m"
	else
		echo $message
	fi
	CUSTOM_DIR=$(echo $CUSTOM_DIR | sed 's/\/$//')
	cd /
	for i in $(echo $CUSTOM_DIR | sed 's/\//\n/g'); do
		if [ ! -d $i ]; then
			mkdir $i
			chmod 755 $i
		fi
		cd $i
	done
	if [ "$CUSTOM_DIR" ]; then
		date '+date: %m/%d/%y%ttime: %H:%M:%S ->'"$message"'' >> $CUSTOM_DIR/$NO_EXTENSION.log
	else
		date '+date: %m/%d/%y%ttime: %H:%M:%S ->'"$message"'' >> $DIR_NAME/$NO_EXTENSION.log
	fi
}
CUSTOM_DIR=/data/log


count=0;
while true; do
	cpuclk="yes"
	#cpuclk=$(awk 'BEGIN{print ('"$(xtucli -m -id 5 | tail -n 2 | awk '{print $NF}' | cut -c 1-5)"' > 2.690)?"yes":"no"}');
	gpuclk=$(awk 'BEGIN{print ('"$(xtucli -m -id 6 | tail -n 2 | awk '{print $NF}' | cut -c 1-5)"' < 902)?"yes":"no"}');
	if [ $cpuclk == "no" ] || [ $gpuclk == "no" ]; then
		xtucli -t -id 59 -v 10.5;
		xtucli -t -id 59 -v 9.0;
		count=$((count+1));
		error $count;
	fi
	sleep 1800;
done