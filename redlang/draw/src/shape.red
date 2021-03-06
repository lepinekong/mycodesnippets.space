Red [
    Title: "shape.red"
    Description: {Draw a shape for iphone background}
]

Full-Size: 828x1709
zoom-factor: 2
Zoom-Half: make pair! reduce [ full-size/1 / zoom-factor full-size/2 / zoom-factor]
left-border-width: 18
right-border-width: (full-size/1 - 787) / zoom-factor
Top-border-height: 110
Bottom-border-height: (full-size/2 - 1515) / zoom-factor

client-area-position: make pair! reduce [left-border-width Top-border-height]
client-area-size: make pair! reduce [ 
    Zoom-Half/1 - left-border-width - right-border-width ; 376
    Zoom-Half/2 - top-border-height - bottom-border-height ; 647
]

light-gray: 250.250.250
light-blue: 0.162.232
img-iphone: load http://mycodesnippets.space/images/collections/mobile/iphone6/iphone6-black-background.png

win: compose/deep/only [
    title {Drawing shape}
    origin 0x0 space 0x0
    at 0x0 image (Zoom-Half) (img-iphone)
    at (Client-area-position) base white (client-area-size) draw [
        shape [
            pen off
            fill-pen (light-blue)
            line 
            (0x0) 
            (make pair! reduce [client-area-size/1 0]) ; (376x0)
            (make pair! reduce [client-area-size/1 client-area-size/2 / 3 * 2]) ; (376x430)
            (make pair! reduce [0 client-area-size/2 / 3]) ; (0x215)
        ]
    ]
]

view win

