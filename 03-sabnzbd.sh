#Install sabnzbdplus
sudo apt-get update
sudo apt-get install sabnzbdplus -y
#Need to edit the default configuration file to allow web access,copy of the orginal file (in case of any mistakes down the road)
sudo cp /etc/default/sabnzbdplus /etc/default/sabnzbdplus.old

#Re-create /etc/default/sabnzbdplus with correct user settings and ports
echo '# This file is sourced by /etc/init.d/sabnzbdplus
#
# When SABnzbd+ is started using the init script, the
# --daemon option is always used, and the program is
# started under the account of $USER, as set below.
#
# Each setting is marked either "required" or "optional";
# leaving any required setting unconfigured will cause
# the service to not start.

# [required] user or uid of account to run the program as:
USER=pi

# [optional] full path to the configuration file of your choice;
#            otherwise, the default location (in $USERs home
#            directory) is used:
CONFIG=

# [optional] hostname/ip and port number to listen on:
HOST=0.0.0.0
PORT=9090

# [optional] extra command line options, if any:
EXTRAOPTS=
' | sudo tee /etc/default/sabnzbdplus > /dev/null

#Install unrar
wget http://sourceforge.net/projects/bananapi/files/unrar_5.2.6-1.arm6_armhf.deb
sudo dpkg -i unrar_5.2.6-1.arm6_armhf.deb
sudo rm unrar_5.2.6-1.arm6_armhf.deb

#Restart sabnzbd
sudo service sabnzbdplus restart
#check with
#sudo service sabnzbdplus status
#browse to http://<your-pi-ip>:9090

#Run script on Pi with
#wget -O - https://raw.githubusercontent.com/wdedood/raspberrypi/master/03-sabnzbd.sh | sudo bash