from mididings import *
from mididings.extra import *

config(
    backend='alsa',

    in_ports = [
        ('bsp-out',  'Arturia BeatStep Pro:0'),
        ('lk-out',   'Launchkey Mini:0'),
        ('nord-out', 'Nord Lead A1:0'),
    ],

    out_ports = [
        ('bsp-in',   'Arturia BeatStep Pro:0'),
        ('m32-in',   'CH345:0'),
        ('nord-in',  'Nord Lead A1:0'),
        ('volca-in', 'mio:0'),
    ],
)

run([

    # Clock
    PortFilter('bsp-out') >>
        Filter(SYSRT) >> [
            Port('m32-in'),
            Port('nord-in'),
        ],

    # Non-drum note events
    PortFilter('lk-out', 'bsp-out') >>
        ~ChannelFilter(10) >> [
            Port('m32-in'),
            Port('nord-in'),
        ],

    # Remap BSP Channel 10 to Volca Sample channel-per-part scheme
    PortFilter('bsp-out') >>
        ChannelFilter(10) >>
        Filter(NOTE) >> [
            KeyFilter(notes=['c3' ]) >> Channel( 1),
            KeyFilter(notes=['c#3']) >> Channel( 2),
            KeyFilter(notes=['d3' ]) >> Channel( 3),
            KeyFilter(notes=['d#3']) >> Channel( 4),
            KeyFilter(notes=['e3' ]) >> Channel( 5),
            KeyFilter(notes=['g#3']) >> Channel( 6),
            KeyFilter(notes=['a3' ]) >> Channel( 7),
            KeyFilter(notes=['a#3']) >> Channel( 8),
            KeyFilter(notes=['b3' ]) >> Channel( 9),
            KeyFilter(notes=['c4' ]) >> Channel(10),
        ] >>
        Port('volca-in'),

    # LK to BSP control
    PortFilter('lk-out') >> 
        ~ChannelFilter(10) >>
        Port('bsp-in'),

    # LK pads remapped to BSP drum channel pads layout
    PortFilter('lk-out') >>
        ChannelFilter(10) >> [
            KeyFilter(notes=['e1' ]) >> Key( 'c3'),
            KeyFilter(notes=['f1' ]) >> Key('c#3'),
            KeyFilter(notes=['f#1']) >> Key( 'd3'),
            KeyFilter(notes=['g1' ]) >> Key('d#3'),
            KeyFilter(notes=['c2' ]) >> Key( 'e3'),
            KeyFilter(notes=['c1' ]) >> Key('g#3'),
            KeyFilter(notes=['c#1']) >> Key( 'a3'),
            KeyFilter(notes=['d1' ]) >> Key('a#3'),
            KeyFilter(notes=['d#1']) >> Key( 'b3'),
            KeyFilter(notes=['g#1']) >> Key( 'c4'),
        ] >>
        Port('bsp-in'),
])
