



#Restart de pi
sudo reboot


#mappings
sudo mkdir /home/pi/mappings
sudo mkdir /home/pi/mappings/nas-popcorn
sudo mkdir /home/pi/mappings/nas-download
echo -e '//nas.woutert.net/download /home/pi/mappings/nas-download cifs password=,file_mode=0777,dir_mode=0777 0 0\n' | sudo tee --append /etc/fstab
echo -e '//nas.woutert.net/popcorn /home/pi/mappings/nas-popcorn cifs password=,file_mode=0777,dir_mode=0777 0 0\n' | sudo tee --append /etc/fstab

#wait for network
