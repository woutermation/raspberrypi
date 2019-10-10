#Install pre-req
sudo apt-get update
sudo apt-get install git-core python-cheetah python-lxml python-pip python-dev git libssl-dev libxslt1-dev libxslt1.1 libxml2-dev libxml2 libssl-dev libffi-dev -y
#Install pyopenssl
sudo pip install pyopenssl
#clone sickchill
git clone https://github.com/SickChill/SickChill.git ~/.sickchill

#We need to copy and modify the init script from the sickbeard directory
sudo cp ~/.sickchill/runscripts/init.ubuntu /etc/init.d/sickchill
#Make the script executable
sudo chmod +x /etc/init.d/sickchill
#change opt dir security
sudo chmod 755 /opt/sickchill

## Make the /etc/default/sickchill file for sickchill to run properly
echo '
SR_USER=pi                         #$RUN_AS, username to run sickrage under, the default is sickrage
SR_HOME=/home/pi/.sickchill        #$APP_PATH, the location of SickBeard.py, the default is /opt/sickrage
SR_DATA=/home/pi/.sickchill        #$DATA_DIR, the location of sickbeard.db, cache, logs, the default is /opt/sickrage
## SR_PIDFILE=      #$PID_FILE, the location of sickrage.pid, the default is /var/run/sickrage/sickrage.pid
## PYTHON_BIN=      #$DAEMON, the location of the python binary, the default is /usr/bin/python2.7
## SR_OPTS=         #$EXTRA_DAEMON_OPTS, extra cli option for sickrage, i.e. " --config=/home/sickrage/config.ini"
## SSD_OPTS=        #$EXTRA_SSD_OPTS, extra start-stop-daemon option like " --group=users"
##
## EXAMPLE if want to run as different user
## add SR_USER=username to /etc/default/sickrage
## otherwise default sickrage is used' | sudo tee /etc/default/sickchill > /dev/null

#Update the boot sequence
sudo update-rc.d -f sickchill defaults
#Reboot
#sudo reboot

#check with
#sudo service sickchill status
#browse to http://<your-pi-ip>:8081

#Run script on Pi with
#wget -O - https://raw.githubusercontent.com/wdedood/raspberrypi/master/04-sickchill.sh | sudo bash