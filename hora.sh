#!/bin/bash
echo "La hora es: "
cat /proc/driver/rtc |grep 'rtc_time' | grep '[0-9]*:[0-9]*:[0-9]' -o