echo "### Expand filesystem and then reboot###"
sudo raspi-config
git clone https://github.com/jipumarino/midirouter-pi.git
sudo apt-get update
sudo dpkg-reconfigure locales
sudo apt-get install vim mididings
sudo cp midirouter-pi/etc/init.d/mididings /etc/init.d/mididings
sudo cp midirouter-pi/etc/mididings.conf /etc/mididings.conf
sudo cp midirouter-pi/etc/udev/rules.d/100-usb.rules /etc/udev/rules.d/100-usb.rules
sudo touch /var/log/mididings.log
sudo chown pi.pi /var/log/mididings.log
sudo systemctl set-default multi-user.target
sudo systemctl daemon-reload
sudo update-rc.d mididings defaults
read 

