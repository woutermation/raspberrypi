#Install dirmngr
sudo apt-get install dirmngr
#Remove openjdk
sudo apt-get purge openjdk*
#add digital key
sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com EEA14886

#add java packet source
echo -e 'deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main\n' | sudo tee --append /etc/apt/sources.list
echo -e 'deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main\n' | sudo tee --append /etc/apt/sources.list

#install java 8
sudo apt-get
#accept license (silent install)
sudo echo 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true' | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java8-installer -y
sudo apt-get install oracle-java8-set-default -y
#remove old Java
sudo apt-get purge openjdk*
sudo apt-get purge java7*
sudo apt-get autoremove
#check success
java -version

#add unifi packet source
echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | sudo tee -a /etc/apt/sources.list.d/ubnt.list > /dev/null
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50
sudo apt-get update
#Install Unifi controller
sudo apt-get install unifi -y

#Adjust memory usage unifi
sudo echo 'unifi.xms=512' | sudo tee -a /var/lib/unifi/system.properties

#Remove default Mongo database
echo 'ENABLE_MONGODB=no' | sudo tee -a /etc/mongodb.conf > /dev/null

#Disable swap file
sudo systemctl disable dphys-swapfile
#Reboot
sudo reboot

#Check swap file status
#sudo systemctl status dphys-swapfile

#check with
#sudo service unifi status
#browse to http://<your-pi-ip>:8443

#Run script on Pi with
#wget -O - https://raw.githubusercontent.com/wdedood/raspberrypi/master/01-unifi-controller.sh | sudo bash