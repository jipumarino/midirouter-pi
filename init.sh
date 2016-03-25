echo "### Expand filesystem and then reboot###"
sudo raspi-config
git clone https://github.com/jipumarino/midirouter-pi.git
wget -q -O - http://rpi.autostatic.com/autostatic.gpg.key | sudo apt-key add -
echo "deb http://rpi.autostatic.com/raspbian jessie main" | sudo tee /etc/apt/sources.list.d/autostatic-audio-raspbian.list
sudo apt-get update
sudo dpkg-reconfigure locales
sudo apt-get install vim linuxsampler mididings
sudo cp midirouter-pi/etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
sudo cp midirouter-pi/etc/init.d/linuxsampler /etc/init.d/linuxsampler
sudo cp midirouter-pi/etc/init.d/mididings /etc/init.d/mididings
sudo cp midirouter-pi/etc/linuxsampler.lscp /etc/linuxsampler.lscp
sudo cp midirouter-pi/etc/mididings.py /etc/mididings.py
sudo cp midirouter-pi/etc/security/limits.conf /etc/security/limits.conf
sudo cp midirouter-pi/etc/udev/rules.d/100-usb.rules /etc/udev/rules.d/100-usb.rules
sudo touch /var/log/mididings.log
sudo touch /var/log/linuxsampler.log
sudo chown pi.pi /var/log/mididings.log
sudo systemctl set-default multi-user.target
sudo systemctl daemon-reload
sudo update-rc.d mididings defaults
sudo update-rc.d linuxsampler defaults
echo "### Setup wi-fi credentials in /etc/wpa_supplicant/wpa_supplicant.conf ###"
read 

