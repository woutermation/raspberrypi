#updates
sudo apt-get update
sudo apt-get upgrade -y
#firmware
sudo apt-get install rpi-update && echo Y | sudo rpi-update
#Change tijdzone
sudo timedatectl set-timezone Europe/Amsterdam


#wget -O - https://raw.githubusercontent.com/wdedood/raspberrypi/master/00-updatepi.sh | sudo bash