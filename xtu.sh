while [[ "$(sc query "XTU3SERVICE" | awk 'NR==4{print $NF}')" != "RUNNING" ]]; do sleep 1; done

while true; do
	if [[ "$(xtucli -m -id 7 | awk 'NR==4{print $NF}' | grep -o '[0-9]\+')" -gt 90 ]]; then
		xtucli -t -id 59 -v 9.0
		xtucli -t -id 59 -v 8.5
	fi
	sleep 1
done

