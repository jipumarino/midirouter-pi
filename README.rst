Raspberry Pi as MIDI Router and Sample Player
=============================================

TODO
----

- Download files from repo in provisioning

- LinuxSampler setup:

  - ``deb http://rpi.autostatic.com/raspbian jessie main`` → ``/etc/apt/sources.list.d/``
  - ``apt-get update``
  - ``apt-get install linuxsampler``
  - Setup linuxsampler as daemon in ``/etc/init.d``
  - Download and unpack ``http://freepats.zenvoid.org/Piano/SalamanderGrandPianoV3_44.1khz16bit.tar.bz2``
  - Download ``SalamanderGrandPiano.lscp`` from repo
  - Autoload ``SalamanderGrandPiano.lscp`` or link mididings action to load it
  - Link MIDI with mididings only, without explicit binding in .lscp

- Realtime setup:

  - Settings in ``/etc/security/limits.d/audio``
  - Removing unused daemons: http://wiki.linuxaudio.org/wiki/raspberrypi

- JACK setup:

  - ``/etc/init.d/jackd``

- Mididings

  - Toggle Mother-32 clock behavior
  - LinuxSampler
  - iOS MIDI interface
