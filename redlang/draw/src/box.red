Red [
    Title: "box.red"
    Needs: 'View
    Colors-inspiration: [
        https://twitter.com/Jamal7x7Jamal/status/1008269417124331520
    ]
]

title: "How to draw gradient colored rounded boxes (rectangles)"
dark-blue: 1.23.64
light-blue: 104.172.248
light-magenta: 170.164.234

bigRect-pos1: 0x0
bigRect-pos2: 640x480

smallRect-pos1: 100x100
smallRect-pos2: make pair! compose [(bigRect-pos2/1 - smallRect-pos1/1) (bigRect-pos2/2 - smallRect-pos1/2)]

microRect-pos1: 200x200
microRect-pos2: make pair! compose [(bigRect-pos2/1 - microRect-pos1/1) (bigRect-pos2/2 - microRect-pos1/2)]


win: compose/deep [

    title (title)

    origin 0x0 space 0x0

    base (bigRect-pos2)
    draw [

        pen off ; will remove black border for shapes

        fill-pen (dark-blue) 
        box (bigRect-pos1) (bigRect-pos2) 20

        fill-pen linear (dark-blue) (light-blue) 0x0 800x0
        box (smallRect-pos1) (smallRect-pos2) 20

        fill-pen linear (red) (light-magenta) 0x0 600x0
        box (microRect-pos1) (microRect-pos2) 20
    ]

]

view layout win




