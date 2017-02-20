
#####Solve wifi-freeze problem (resume wifi)#####
echo "#/etc/systemd/system/wifi-resume.service
#sudo systemctl enable wifi-resume.service
[Unit]
Description=Restart networkmanager at resume
After=suspend.target
After=hibernate.target
After=hybrid-sleep.target

[Service]
Type=oneshot
ExecStart=/bin/systemctl restart network-manager.service

[Install]
WantedBy=suspend.target
WantedBy=hibernate.target
WantedBy=hybrid-sleep.target" > /etc/systemd/system/wifi-resume.service
systemctl enable wifi-resume.service

#####Cannot-suspend problem (allow the ST_SENSOR_HUB USB device to be suspended)#####
sed -i -e '$i \echo auto > /sys/bus/usb/devices/1-1.7/power/control\n' /etc/rc.local


