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
sudo apt-get update
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
#Installeer Unifi controller
sudo apt-get install unifi -y

#Aanpassen geheugen gebruik unifi.
sudo echo 'unifi.xms=512' | sudo tee -a /var/lib/unifi/system.properties

#Disable swap file
sudo systemctl disable dphys-swapfile
sudo reboot
