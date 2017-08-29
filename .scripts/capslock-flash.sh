while true; do
	echo 1 > /sys/class/leds/input0::capslock/brightness
	sleep 0.5
	echo 0 > /sys/class/leds/input0::capslock/brightness
	sleep 0.5
done
