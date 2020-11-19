echo "### Expand filesystem and then reboot###"
sudo raspi-config
git clone https://github.com/jipumarino/midirouter-pi.git
wget -q -O - http://rpi.autostatic.com/autostatic.gpg.key | sudo apt-key add -
echo "deb http://rpi.autostatic.com/raspbian jessie main" | sudo tee /etc/apt/sources.list.d/autostatic-audio-raspbian.list
sudo apt-get update
sudo dpkg-reconfigure locales
sudo cp midirouter-pi/etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
sudo apt-get install vim mididings
sudo cp midirouter-pi/etc/init.d/mididings /etc/init.d/mididings
sudo cp midirouter-pi/etc/mididings.conf /etc/mididings.conf
sudo cp midirouter-pi/etc/udev/rules.d/100-usb.rules /etc/udev/rules.d/100-usb.rules
sudo touch /var/log/mididings.log
sudo chown pi.pi /var/log/mididings.log
sudo systemctl set-default multi-user.target
sudo systemctl daemon-reload
sudo update-rc.d mididings defaults
echo "### Setup wi-fi credentials in /etc/wpa_supplicant/wpa_supplicant.conf ###"
read 

