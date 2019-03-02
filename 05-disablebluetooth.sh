#Add disable to /boot/config.txt
echo '
# Disable Bluetooth
dtoverlay=pi3-disable-bt' | sudo tee -a /boot/config.txt > /dev/null

#Disable related services
sudo systemctl disable hciuart.service
sudo systemctl disable bluealsa.service
sudo systemctl disable bluetooth.service

#Run script on Pi with
#wget -O - https://raw.githubusercontent.com/wdedood/raspberrypi/master/05-disablebluetooth.sh | sudo bash