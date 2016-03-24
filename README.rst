Raspberry Pi as MIDI Router and Sample Player
=============================================

TODO
----

- Download files from repo in provisioning

- LinuxSampler setup:

  - Add autostatic sources.list
  - apt-get update
  - apt-get install linuxsampler
  - Setup linuxsampler as daemon in /etc/init.d
  - Download Salamander sfz
  - Autoload .lscp or link mididings action to load it
  - Link MIDI with mididings only without explicit .lscp binding

- Realtime setup:

  - /etc/security/limits.d/audio
  - removing unused daemons: http://wiki.linuxaudio.org/wiki/raspberrypi

- JACK setup:

  - /etc/init.d/jackd

- Mididings

  - Toggle Mother-32 clock behavior
  - LinuxSampler
  - iOS MIDI interface
