sudo mkdir /var/log/mididings
sudo mkdir /etc/mididings
sudo chown pi.pi /var/log/mididings /etc/mididings
# copy 100-usb.rules to /etc/udev/rules.d/
# copy config.py to /etc/mididings/
# copy mididings to /etc/init.d/
sudo systemctl daemon-reload
sudo update-rc.d mididings defaults
sudo systemctl set-default multi-user.target

