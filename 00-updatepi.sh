#Get all updates and start upgrade
sudo apt-get update
sudo apt-get upgrade -y

#if needed upgrade firmware
#sudo apt-get install rpi-update && echo Y | sudo rpi-update

#Change timezone
sudo timedatectl set-timezone Europe/Amsterdam

#Reboot
sudo reboot

#Run script on Pi with
#wget -O - https://raw.githubusercontent.com/wdedood/raspberrypi/master/00-updatepi.sh | sudo bash
