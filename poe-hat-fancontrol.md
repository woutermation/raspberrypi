# POE-HAT Fan controller
  
Create file /etc/udev/rules.d/50-rpi-fan.rules  
  
Input below  
  
```bash
SUBSYSTEM=="thermal"
KERNEL=="thermal_zone0"
#
# If the temp hits 60C, turn on the fan
ATTR{trip_point_3_temp}="61000"
ATTR{trip_point_3_hyst}="5000"
#
ATTR{trip_point_2_temp}="71000"
ATTR{trip_point_2_hyst}="2000"
#
# If the temp hits 80C, higher RPM
ATTR{trip_point_1_temp}="81000"
ATTR{trip_point_1_hyst}="2000"
#
# If the temp hits 81C, highest RPM
ATTR{trip_point_0_temp}="82000"
ATTR{trip_point_0_hyst}="5000"
#
# Fan is off otherwise
```

Reload with:  
  
```bash
udevadm control --reload-rules && udevadm trigger
```  
  
And listen...........  
  
Check temp with:  
  
```bash
/usr/bin/vcgencmd measure_temp
```  
  